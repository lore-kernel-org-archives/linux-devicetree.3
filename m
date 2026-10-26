Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025282;
	b=DSlqKHCkBV9irOiuaE4A8eAIixyZ1sUxKnNEysi66XY2E+sY0I79mzDKAxlvjGN1APhx
	 bJFuSqBpLolODveVRPvlTod/LgFLSrJmudmHgQo/p2P1BgAVg+wLxz4ozYxb6m8Gh39uD
	 bPhntrudgfnSHfB1sk6cP4tuGZVKcCtnixFpwjALxvCYr9TxV41TZS2pGO609dUhxL1iP
	 omIno9Sf9D44o/J8RZZXthiimSn/tYuJDABXEGfIEENfqPSaLehSxaTF9EucWVUx0um0E
	 Xzxsv784z3/8TQ1/B5DLFQcSCuVVAfG6m7p4fzCuvK58IjtzdQMn7iSUGd36oLNxRMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025282;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pJz0q/j+a/Ss/3BCRCnhr/q+DN+SscbUuCywmDGVV1U=;
	b=GoYgsSeLGCM3nHD6XANQ+9aj8hb1SBLXEuvE813f8EjGNCOZ7G9vyQBv2tF5usF5wXfu
	 R4L9PFT2q2cst/I/Aq+SY2w2ZG897GigfgDs9TH0LDy55CcXScxHzdAUpP4pX0QojWpWY
	 o4UxoU6rJLHEKtOBlGO8sRj1s6Ju5H04k22hI4Z0CXe/LhqMuehRB8ojf4u7s1LtezeMN
	 JJtyf5fWG71RQLNGgUVEJCguLHKS/WGmCx5lX48Gb2e+EslarBiEdQbU38cLLeXjvH3J6
	 0QlT3m8jVBh91NPwqZ9hR/hHXwX50A1jxSIS9b64Qx6MRbIQPA2ugoVP/vFCmbkM5iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M6OOEvqt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Cwbj/FgC";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF92606A320
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 14:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EF92606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M6OOEvqt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cwbj/FgC
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt2QX4131986
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 14:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pJz0q/j+a/Ss/3BCRCnhr/q+DN+SscbUuCywmDGVV1U=; b=M6OOEvqt6/cOKucb
	Q5OZwST7lwdGWa0CSwaN9mN3wvTl4izer2/55/0Yxz5XAKBB5yBCOXNb39Z/7Q0e
	Shrps8jXSHZ+7swMbp5qt6OSKKGfg5x7OErAi+hO33NTjwcmKfBvrA9BWE1NeA3T
	4WfViqkG2Wd1IU2zk9xVpVFVcYuu/waF9Zrij3BRqS9rSqU0cxSG5Pgc/xdyg4iB
	eaflTv65SmyOjzkhMl4SuTkIJVc2Jft3XJFXdyrNnrPmFSoZFAnNgQhg6TqbO89L
	N+196sbu32KAvWsTrDFHvkLRxeARlTe5X6RTiA/ogPIb91kRH93+xhkZe/xp795N
	Uz4tSg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj53q0vyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 14:34:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so635159085a.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 07:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793025279; x=1793630079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pJz0q/j+a/Ss/3BCRCnhr/q+DN+SscbUuCywmDGVV1U=;
        b=Cwbj/FgCD7+rEKC+Ce6WVh//A7bXp1j1+fRY9oQ0BENDfNtjTIKAZKox/h5lYAYldw
         iwXF/BcW20rnkONsNQVjiOvYTVOPeAwy1yoSoa/tHGbwYUfHzg2w1ieDtUIUCDfiDT9F
         k71Jsmq2/NslCZI3wOPE/YC2FW/9dPaBV05x17/hb/qCqvmk7mruV0VkgR33HzF0b/Mn
         pnG2Liu/OwECEewyzIh2zI6zVGaTgqsMBkSSOvfUFCPZZYt0Py6em5/S+e/AP1PvCKrD
         YJeE6LuRDUlCrwOJXD9wQal9lMUH2ILLYGKkxR7CQ9s1d8T2g/nTu43Ee9MRkb4Nu8if
         BuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025279; x=1793630079;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJz0q/j+a/Ss/3BCRCnhr/q+DN+SscbUuCywmDGVV1U=;
        b=AOHgG1RmvrUdIrxGQhc5hL5BG2zLEU/8GQCdXNMJyzhimcwAIohxdg5/Qhf0I/ZHG/
         st+vo1DunlRiDL2ciYJKBUn+nG3CCegyV3IzD81GGs3GR+pmLvM9mlXWooF9VvrlUa8p
         iB3Qmfr8hHPRhI/vmuYavGVeL3advJnaSEiZ78GMDqnrs070hf/PEyO4/SoWoeWx0HmL
         dkOypQ/PiBX2bB8YFtMCrQVT8ZWlZZlasLJe0PHP1ibs6Ro4qInhzo3IJQ7EGGdtPrqb
         Jmks6cJBBKwo9HtxMDD2EpT/GydxdvZduhdw1MsZXWfJGL8twFUVC1OkGpsNGgCJtvoK
         cb7w==
X-Forwarded-Encrypted: i=1; AKwUvBwyDU0FKj4lF7w6BI6HIJ1d0pjn4kK3DEtvELy4bWaZ2qATjXxNKbUfC34CX/LvX+Oh1gZ+hfsQWtrz@vger.kernel.org
X-Gm-Message-State: AFq9FYIPpWFWlZ+aaGyZ7EjNd8kEzNaxoJeX5D53QXo6P8upsfXeUBHq
	AXLkEbaymwZzVM6l5xxzN9EGKGPN/Q1Sc0vkbyy7P1B++qYFnsAqEvSkfvqVKrcL8K/OtH+u0yS
	KjelutKJMwbc2X9BCis9mcRf4cXUOOKv9/YdQr7CqbHr7dQCTaPtey4aVm868C0LK
X-Gm-Gg: AYBFou1ivdNUJ63XY0lRoMldISrk4ww8rPnCOMCPnh2pvc9C+mOfskEI0btOG2L5zjJ
	LIVoRhkPVkHIBs93Sl/eOpMFNNT+ZkmlmTsIS8k1J8f+9tgYESeCoPD+AScKmaugPKWcueIHJdF
	2Z76npyC8dTOtLJUCHnsJcAlzrr6b3elcMyF6J+WTQBnI2F7BY8inzOGpjjo0eeMLz0+ePbWbhI
	sX+R74gQpdspYzUSZTrhmK87dweruWbXTZB0KEXssnsyElEY63ck4ES8/kKbH+el/s0OPDS8uiO
	6vqfCnALwlF5+W456L+d9TxQBoPZqWr7EJuiMVS7K0u/gji5aHjH6R88qNe18NBTE3pauoJkPzc
	rqzejofyKYWtzEdIWUWw=
X-Received: by 2002:a05:620a:f06:b0:93f:3978:481a with SMTP id af79cd13be357-940ef90a7a2mr997538785a.51.1793025279557;
        Mon, 26 Oct 2026 07:34:39 -0700 (PDT)
X-Received: by 2002:a05:620a:f06:b0:93f:3978:481a with SMTP id af79cd13be357-940ef90a7a2mr997532885a.51.1793025279058;
        Mon, 26 Oct 2026 07:34:39 -0700 (PDT)
Received: from [10.40.99.45] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445984207sm3552132a12.22.2026.10.26.07.34.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:34:37 -0700 (PDT)
Message-ID: <bbed82ed-97aa-4b12-a8ce-a4f21ed60595@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:34:35 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v11 1/9] media: qcom: camss: Add V4L2 meta format for
 CAMSS ISP parameters
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org
References: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
 <20261023-camss-isp-ope-v11-1-0c2937195298@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20261023-camss-isp-ope-v11-1-0c2937195298@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1OCBTYWx0ZWRfX5Ao0mVGPzBdm
 RDd9GQXSL/n219xO0hfORLTIhYNROT42XkdDQwhgdsPnhNdQe2dFrIaL+ieQbBEOKdtFF8MS1Od
 9y1RcQgrieIYfjn/ZKWNHhys/bPknts=
X-Proofpoint-ORIG-GUID: F5m9emNl63zg6aSHcMhJWTeafKzUEeNO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1OCBTYWx0ZWRfX3LNRF5X296A6
 2mteOFA+A1gyEB+5Ddl963zI5J9dvqx3SMizwBp/HrN/jyEn4u0IJ6OCqEJVNnfT4sQtpDRjQvi
 c07Ot5f31+caSC68O1XwUL88KC3wZD+WGGpMHoQBKXe9AaePpUDPgsJRtPR1Mx4X89NPFtLclQ8
 E85a0SX3hMd3F09oXUugk1xHAzB+hoJwe8kOoMceze9igyDgFXtpIXaT7T6P6Dmzn82hIgxpWHT
 2BSBKbRPxqdmFdKuGq99tk6pXElAZ2GCcVzbqkI03bcDuuF4beOQ8f2I4DxVHSLMzDXBFSNYU8C
 rsUpKUJB11EnT8g4Qls/0ow18r/uPXXakZxTIa1x1cOv66faoM8gIcOd8nktXT3ODuzA10RpTvy
 VStSxAwNpWaiHwBbPqSOpxK+LF2naQ3C34yJVLxA/J9BLqQev4F5lsYYp76pj7KuvZe6IFViGmX
 sQbpxAz2dKGTux0uTMA==
X-Authority-Analysis: v=2.4 cv=D93SufRj c=1 sm=1 tr=0 ts=6adf6500 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=rrvG0T/C2D967D07Ol03YQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=cfCy20KhcoV1EizUSHcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: F5m9emNl63zg6aSHcMhJWTeafKzUEeNO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260058

Hi,

On 23-Oct-26 5:09 PM, Loic Poulain wrote:
> Add a V4L2 meta format code (V4L2_META_FMT_QCOM_ISP_PARAMS) for the
> Qualcomm CAMSS ISP parameter buffer. This format is used by the params
> video node exposed by CAMSS offline ISP drivers (e.g. OPE) to carry
> ISP tuning data such as white balance, color correction and chroma
> enhancement settings.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans


> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
>  include/uapi/linux/videodev2.h       | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 17ba1ae707355a134047de646f61fcc2d1512d4c..cef1593c1835070f7b34a8b8c860738fb77f533a 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1471,6 +1471,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
>  	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
>  	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
> +	case V4L2_META_FMT_QCOM_ISP_PARAMS:	descr = "Qualcomm CAMSS ISP Parameters"; break;
>  	case V4L2_META_FMT_RPPX1_PARAMS:	descr = "Dreamchip RPP-X1 ISP Parameters"; break;
>  	case V4L2_META_FMT_RPPX1_STATS:	descr = "Dreamchip RPP-X1 ISP Statistics"; break;
>  	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 5373dba640fae3d19247ab1c74ba336e05dc0fe0..70208a9443d8ade569f130e2fc3d6beebab6b636 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -893,6 +893,9 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_RPPX1_PARAMS	v4l2_fourcc('D', 'R', '1', 'P') /* Dreamchip RPP-X1 Parameters */
>  #define V4L2_META_FMT_RPPX1_STATS	v4l2_fourcc('D', 'R', '1', 'S') /* Dreamchip RPP-X1 Statistics */
>  
> +/* Vendor specific - used for Qualcomm CAMSS ISP */
> +#define V4L2_META_FMT_QCOM_ISP_PARAMS	v4l2_fourcc('Q', 'C', 'I', 'P') /* Qualcomm CAMSS ISP Parameters */
> +
>  #ifdef __KERNEL__
>  /*
>   * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
> 

