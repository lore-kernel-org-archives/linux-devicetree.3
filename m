Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794576242;
	b=F3hf54VfwF85UuDIZTM6pl3/6VkIoj8MtjDYOhxhISVnO5NMBU5GJYn38RzVrfDulnqw
	 Qu2kxq17UjVrixOI8chW/+FnWjnq6KZ6z+z9LrdIG7Ogn+a0smyJ0Dso5ThETcySNvP9K
	 82BoyJufw+mM5WvNLaEE8Fv/Atg12RxOO7yATV43Z8B8W7dpKhxhUPJBe3HEf/J95AG8B
	 K8nYQNIc63ESUQhTp7+x29j5M/XdPfpZHBpLHiFL5gP1OOwk7Ymmsv1d6/tD7S+338B0C
	 APTQIWfYfusWIO2Uy4OlLwEw7WzscmVgdy/bXF/OC/gdOeKekhb9XMqvSXzVQJWslxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576242;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MqQSzfa4X2q1eaOzzledzFWV9wSVN6Ii42fhCdUzIzM=;
	b=qf5MzC+xwFKqYBqeQfWrTlFk4zhxM4xRa9EFNKEWFbAJmepPDoZN2QkrIjV8rIf7z9p8
	 BNUrXc+h9JsoJWVejsXbZs84F84L7J+2LAoiU5tiYvTz2K6FCTt7CNJy/ar0dM4u93CL0
	 zlVCG0hPborsU9vlPGn/rd2iHPSzUuAgQt5hGp56eFKvAeRbg1t2NhjbTsSOIvfzbziYK
	 Ujniem+HwQ/ZBPgQlo0NlmE0i5SBEyWMckmwvd9iSbHbfWeMUlqq3c6ajihnFTUX5Sp8/
	 1NlX1xqKQXrC7YWtjbMwHSkI4P3jr7mMZyy0VYJ0AN184NQPsBn6cwVh3OhEJJe3nPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gSvbWoS8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KvFIjsnO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C6D606A336
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4C6D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gSvbWoS8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KvFIjsnO
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJlMn036611
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MqQSzfa4X2q1eaOzzledzFWV
	9wSVN6Ii42fhCdUzIzM=; b=gSvbWoS8Oi2eyjt1WvdU1+Ub6y4YmzlIfZRc4cpx
	vSBQLHqz06je8f6hf/DLqfnFtBa+nMNxMCPecB7FR0JUDu947qCjlVhKa/WSpDBC
	7yIhzd9tnr9WKP+7x60+T7leBlgoAHz4CefbIwsy56O0zQ7xbdTX8dZ0Wcl/Sgrq
	YI5tlCu/aFC/T7FWfMnjCdg9Kbl1ZPrf6JQNOR+au6O7ior4Ay37H6ZirhOvtbCK
	yITIPAHxWYt8gJufiakwd4+Ujk8VTMSgmlKB8n7O8TB7b41LqLNyQHLehwKPrNA9
	LPoK/oWvaggNs7E6tWSFESq/4XlRfIpZ28Hx63LpwbPGTw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvja9hp8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:24:00 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5edfa36f42eso1043545e0c.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794576240; x=1795181040; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MqQSzfa4X2q1eaOzzledzFWV9wSVN6Ii42fhCdUzIzM=;
        b=KvFIjsnOvrEeB6AzC4YGO647jDPM/TXoHx0DHxRQgweuBRwfxSLVkELgpT852a5yBf
         jVr3jKVAxCnJ7u3OI43buKefZ7FkqTD84kH67RSJ3SfW25LTw/NQKZBCRv2rGHIzMvWe
         9fBsqgDH6qX00S7bZQavA3e9gxFsElz2ZJxHBHsTM9QBNm0GOvNrvMlXN1c/8uVzavqz
         frDKBpqeY0PR+0MCXjrt4kk4/R1ZkKW06A/lGH0qyQrj4/j8ziL/7zY286CXOYVuCVfs
         /MmNDwVGNrRPqth8sMoL6tBYm8lH3GxGN8NVxGK7HsKIKvB8P1kNDuYV1TE450R0qviu
         I6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794576240; x=1795181040;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MqQSzfa4X2q1eaOzzledzFWV9wSVN6Ii42fhCdUzIzM=;
        b=Gp6fobB+3X9gFyP3ObynKQfl0yZQ42KKy4b8Us09df7tS5u0OEY6iQW3X3Ej7uWO2d
         cp2OiDSrBfeVp8BnBGok4r8fMx22TvbcuThbCSpl3FPR+Q1ZWN7VZ4YGs+huB1k4xBgr
         MzYAb56RfcN+NckeDRys+YYZ6X0Tx/QeoVrUO9v/IIy5eJNbq07vVLFm2jadRJtG7H7t
         +gNwa5MjhS3r5H0aR+m8HDMq2iy/gymyH/cF+n0bvz/gnlZt/4n7KLSmIXQkjb5VvPbJ
         QBY5xwxT4yXsAI5l3XltczIfMYac0JtMuHPq9bhDip9DXh62WqCpOtdl17t/G6lPg1yL
         +nOg==
X-Forwarded-Encrypted: i=1; AL+hErH2qATWc1miVE6Wdi9s/GC4cxwnYYAF6twqK8zDeFKdt+M2Uu/u3i8oiYEwG7YgoDevGzbpRu+r1faB@vger.kernel.org
X-Gm-Message-State: APuU4Z97/0Es76Hl92ZLXiMTWAi0RgxVmd7gNm78eE6J7mPL8VFc68Vd
	4+5+3FdM2PfugqE0mzO3BiR7KEKN76ZEBdh7Re2WjVrekBzbFlYwHEXftUi2kT9Rr5qFP2RqoOE
	ITTwaxNELktXkmmjYjBPc5vONTex/LK+MuiOFFLPhg4t/iX/BY/MB0qh44LwjR+A7806CfmSz
X-Gm-Gg: AYBFou0wpi4yj3ed4uklwOqGFPD3cgp81T/NxpnICpBloB3iVpDMu4QwtQ9lSfnOxqW
	Wn1oLYbjfuut9wbQYnhxUPvyuafZTe8BDXJjM1qcDXCT++ZisriQDcRkC3JgNpMMXejRkalm5+a
	WecVzAL4F9BSgMY2mHJyB0zLBEc43s/+FROt00UxeR50FlDxD/VEIGmg1PIh04a5FX86kOY5JD1
	hk1mUR0fUqoOc3YtOgg9XA6uW1ymEXNRwyu6ZqmX/KEVaNZoxqspmYucTACCKX/S2xQmmvxceQQ
	rDCrCgCtJ0cCtYng5lfm3FtbF2YDOSxg8hDDXL/8j1El7f+/VSgNpPS4x9fpQkB48BKNFOt1JcG
	YkHNLxHsFhRrjwuWIHEUxJhmZ9eLimwgHWBehKkt7AgEeht/dhUCNl7JiSOQZ4UVd3i7y2gdhLJ
	TphtgtPGU26dwCel8Hv7BZk9kuIFeIdJrIRvUlyUI7caFD4IV9WyablcLilfvcGw==
X-Received: by 2002:a05:6122:c84:b0:5ec:d5e1:ee47 with SMTP id 71dfb90a1353d-5ee34a46714mr861534e0c.5.1794576239767;
        Fri, 13 Nov 2026 05:23:59 -0800 (PST)
X-Received: by 2002:a05:6122:c84:b0:5ec:d5e1:ee47 with SMTP id 71dfb90a1353d-5ee34a46714mr861522e0c.5.1794576239222;
        Fri, 13 Nov 2026 05:23:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712d9f7esm747180e87.12.2026.11.13.05.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:23:58 -0800 (PST)
Date: Fri, 13 Nov 2026 15:23:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add MSM8996 SAW3 syscon compatible
Message-ID: <wy654rwebljpfzii6liwqhebk4vuohlskhp66g45fwei6zwtj5@kc3k4enc6s6e>
References: <20261112-dtbs-qcom-v1-0-1978370c7cad@kernel.org>
 <20261112-dtbs-qcom-v1-2-1978370c7cad@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112-dtbs-qcom-v1-2-1978370c7cad@kernel.org>
X-Proofpoint-GUID: ZMaM4mXauGjeWbd0kZfOF3b8ECmj7ICW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1MyBTYWx0ZWRfX8sHQHqJVx8hX
 mdAQcg6ZwLQvpPG6MEMncbKxnNf9d9uyDc4jjoeacDbwfVFCsMiwRoZLMsbJHEBpVSSXTYLDlqs
 RIrUHfLY+C+02h8hR3TTu2xRFjWdCjk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1MyBTYWx0ZWRfX16MY5uccCamL
 BklkrzvBgxpz3NhaQX/yah5pI3JunnMa++dArfqC28FTGkMBRKymNWK/xl6GHqA/lOshwTN4jIp
 0nTfCofQCBJs+Or58TwHuU/zQPQAaBFcvJ41qX8LgAbRFEL5c00vU8EHnQKYbudQct8B+fFyKmi
 F0yyQX8SvkwD3Tfxn2XGggf26jUHeUlnPtiIr5REozxu6E22Mhm1ncPo9WNyJPWdEc8Rjye6s9v
 iyYe6DQ0cJd3B1GxDN9YYUbpSDidXls3RIso4HasiKF0TlFvIA7Lig1CvWkaJVckDNN6yOnM8Sj
 pI1uhmRmIXGhA+8+YTw74g7/qth8He3jkmjr6aAuTU6J9rTKtkUuYrssQJ7dF1fyoyl64e1Yils
 2AhM3QzbF1vanD6WSvWQEugKX8Mf2ugziwfTnBXDu52KLu1rTZX58um9PMaazcBnYfOzWzvttJr
 PhdAu3WI8vCJ2c/D7qg==
X-Proofpoint-ORIG-GUID: ZMaM4mXauGjeWbd0kZfOF3b8ECmj7ICW
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af70f70 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=9GAwKLooXcChzj6GhEEA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130053

On Thu, Nov 12, 2026 at 02:26:40PM -0600, Rob Herring (Arm) wrote:
> 'syscon' nodes are required to have specific compatibles. Add
> "qcom,msm8996-saw3" compatible to the MSM8996 SAW3 syscon block.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 1267c56d586b..4e8eb82420e2 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -3793,7 +3793,7 @@ frame@98c0000 {
>  		};
>  
>  		saw3: syscon@9a10000 {
> -			compatible = "syscon";
> +			compatible = "qcom,msm8996-saw3", "syscon";

Can we please follow the rest of the SAW devices? Rob, would you please
change it to qcom,msm8996-saw3-cbf or qcom,msm8996-saw3-v1.0-cbf? There
are other SAW blocks on MSM8996 platforms (which are being controlled by
the firmware on the devices we support upstream, phones with older
firmware might need to name and control them).

>  			reg = <0x09a10000 0x1000>;
>  		};
>  
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
