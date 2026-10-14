Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3079553ECFC
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 14:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791986715; cv=none; b=XlS1w1eJHnMZWwgMpn2eXeeoXUlAG8hJ5ULomtXzukaXVsUSZMFaEkm312Sftivc+du3O9X4TfRXAH6eq6U85YXKpo7g5idj0xXCJM9IdJ75igWPVSsYQ7FHs4YkuegA8X3HHfHsMCUfWmfLGWorRNc7HucnHZsvNOs/eOVroIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791986715; c=relaxed/simple;
	bh=on2PEhB3zQq1g4jTu3KddnrV7cQSAaGoMUS/teguhck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jXPGbSqdVMVWbSTcm1rbezxn95ARqr4+yl0TicLhC00P/kln79n82yPdckrcMuw9K9fuoXsoUv0pUEQb1k+yFX4zQdf1p9S+hllYPPuzqUMTGKiC3C2R6pLtv4t//Mr07TfdwhQEfL8KKNDyyKWc2XtMPVih8efV+A61JbdzZP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H4YyJgJC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gqm+93QL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H4YyJgJC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gqm+93QL"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EDPbKd3018180
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 14:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DXB1+owYQBBqW88XzzY6K4eceuh+GlN0C86aFl0rv78=; b=H4YyJgJCbnABl9nz
	FmZ7sqPp+0OU5N0uI4WwVsQ6BxuZtcWiYZwgKoCwW9E/5flb+LG/sKBPnUMaNxGb
	7MiUv6vxm7rrJbssZja31V8RfPFlrQZnt4pmlMul6VixjbYUpA0WzmfXSmxssXsH
	GexKlSPHb4hhG/zIxIejefUy3VlURerLDXzfPEfZFE6w+E8ycwFaDDvZSLAq7tVz
	Ph5zbELPlNS8yM7v3qB2/zxDXe08DKhDLq2hCDYVlbcyt4Cx01KAMKto9sft7DEG
	ZNjw1b90zrQdHjUPewyxunuqZJHwgsqSU4Q9iiHBK/BDfDVeL7xKFNUXBM0H/+jz
	QAPAzA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s2b4nq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 14:05:09 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90520763ceaso16704696d6.2
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791986709; x=1792591509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DXB1+owYQBBqW88XzzY6K4eceuh+GlN0C86aFl0rv78=;
        b=Gqm+93QLsvhXkJGzpMiguhMUoOOWRp47JkJb/vPHAmMuqVmorC5sjrbFdCBfaRWp3i
         5yh6XyFHB01QIV/05mexdANyKCBPLA3hyh7kF2udnQP9kH7v94z6GEamTe+RuzwNrY59
         e7MRyGo9tjbVFHTp+LloYaLEvQAFqFbN8wvMbgUxV5I+gj8KoqFhNOZOpcS7pGKl351A
         MfroU84up89C1p8xQ13PbqfD6m5h1mSgva89+GPg+CicaxXavVZJoxQEAaR87Mq1V7B3
         QXmo6aACGyekZVhW/EBQ+2QCp/ur3XzpfVn37YrnMedZRgj6DlKE2I6m9Fa6GewkYw1Q
         5I9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791986709; x=1792591509;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DXB1+owYQBBqW88XzzY6K4eceuh+GlN0C86aFl0rv78=;
        b=xdyRd8mAe4ULYpZhF0Iv4TOq2fbeljEfyfjsBFLB8xG99+Tux+b0zfrPZKUN2yebHG
         PAE9YspEnMnf29GTu1g2EdBAJWOiZ/kWYn4fSXNOtAdJoU/ayL1XG5544F1e0cCAhbBD
         kigyjYt18ktQ8yhzLEIT2AGRTI1p/2rYWr9Z/U5nOmIlDC8ski9jm7LwAZTp0k55AC/U
         sRc8rR5o8nWS/OfpZKRWYvCZQdYF1YWL2LT4IbmCuffWnMStG5qTMpfdKVwFTw1ZMO6S
         EcF5BV8e3PMFEzDjgDrEjsAmHo3EY/mhrfJ8vEnDC4fyebqG4qaJ9DwwZ0zmgZUuOsL5
         zKSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAGYHfEcQ/dTJ5BY4p/23eU6dDDUZgE6iB5hEjPqh3dj3x2v3HizDoYJjtg4vvashsN7iFM/FCsq6I@vger.kernel.org
X-Gm-Message-State: AFq9FYL1xwdFddi3cVuCgJc0sGIFtqSv9zJjJvo3+Ml3+gTE57JyeHz/
	go+h/YaEhs0BJGx1B49O+Dn92nyPBPMBn8UuQJpCa8VofWKB1EptKnrbLhUrWcH1JJxjAYr5AAs
	lPx7XIiLKPl0nuwa+OD9Sy6x8L+eoxbo0cfrYGT/1kthB7ztGk2S5Sj4vWUQmlFrH
X-Gm-Gg: AYBFou2BOsvn/tuSQGbPS1EMRhfgohNLGWPsZF9lR8zENrYtQI0iqDO60QwQlhsswWh
	/Scl+SZTL3mveeFWLGmytVQMHGLoPBIKRRIO1OP63VUxgNGUch2j3HXN4qaQ8dMgtBcVK3fcQzJ
	OTJBtaZvm/M4DUgJ5j48cdh7THDv7blkE2ZPzmVh8RU3SuCF4cvwE1stgusgoXeilbcDwcJHdat
	WI4Llid2Qm9vBERUXna6fa6IB2MiXn7KJ9+/y30r+Wm2cUybjMrnATmDCAeZOKDNIYni0WSqXcG
	6bLXon8jNH/iEGUakLOOn14vqnpqnDt70S7uRdy5dSgVFD/9VMPjiGOp3ZLd6466MM+LIIy6dx4
	dgOt9dr9hqCt9zJaGFV7b8A==
X-Received: by 2002:a05:620a:6498:b0:93e:e111:2771 with SMTP id af79cd13be357-93ee1112d0cmr1775884885a.2.1791986708878;
        Wed, 14 Oct 2026 07:05:08 -0700 (PDT)
X-Received: by 2002:a05:620a:6498:b0:93e:e111:2771 with SMTP id af79cd13be357-93ee1112d0cmr1775875785a.2.1791986708169;
        Wed, 14 Oct 2026 07:05:08 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c6805985sm38426281fa.2.2026.10.14.07.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:05:07 -0700 (PDT)
Message-ID: <11f513bf-fdc1-419d-8eb6-5cabb6220fbb@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:05:03 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 5/5] arm64: dts: qcom: glymur-crd: Source MAC
 addresses from a UEFI variable
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
 <20261014-b4-nvmem-efivar-v1-5-187c85f65018@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-b4-nvmem-efivar-v1-5-187c85f65018@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RPQmjIi+ c=1 sm=1 tr=0 ts=6acf8c16 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=jRqq2JA-ig1rCJpZVWcA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: -E-JziQ50StLpHHKyaYwDzovmFYyCHac
X-Proofpoint-ORIG-GUID: -E-JziQ50StLpHHKyaYwDzovmFYyCHac
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NiBTYWx0ZWRfXwd9ebL5LyfMF
 pRtDJ1I6GfbSUkGISs+qxCHJnEamiNVvfFZeXlnyn+Vy5CDbNGuyiQL/YR+JF/UqykWQPQ9n5Vm
 rnqtBHUHxXPk7vu7ijYqZ6L8s+J1Nufw2AwGOYPsjhQXPlk+JVFWK/xKjqJhUdGpriV8Ko8wlVx
 +v8k834m0eHUz/XBcJnIWQWopfeyF4QSSGiEArlkIhSU33+RjAyMqabn0gAVjbm1j1ZjwIPc84f
 5DSUDP3jv0lxSiMiJTV0RT4tpBoDP4aTBj1o6ZbzMW58nJ5gg74voJA7SSPF8DHuoW6a7iZghTo
 MDH0fQqMoJJ4bqjj+dIFmObCj904Ngwobn2xFt6ocUAWsoSiZRyXVGA5IHma1hcfwEc3i3dod71
 gzAKWxMclpgdI/VlXI/XMUt/1pen9SIjbwAcJqrYEQ96sz8y1Lzywci7QbEOqClydrvYWMwSR28
 pX6p83VrpPo+QLqobcw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NiBTYWx0ZWRfX753Ia3WGCxwF
 g9vWMJfPPWqZqHwJjOfGz1ZyPCoHatF8xy/oDhEPrtUFH6lgwP1FbFZ08TYNdk0rdPYrZtskZif
 kPP+ky6+qERBMhzsX5lp4v0/ccQW3Bs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140056

On 10/14/26 3:02 PM, Abel Vesa wrote:
> Add an nvmem-efivar provider exposing the "MacAddresses" UEFI variable,
> carrying the Bluetooth BD_ADDR (bytes 0-5) and the WLAN MAC address
> (bytes 6-11), both MSB first. The variable is looked up by name, so no
> vendor GUID needs to be hardcoded.
> 
> Wire the bd-address cell to the Bluetooth controller and the mac-address
> cell to the WLAN endpoint (pci17cb,1107) via the standard nvmem-cells
> binding. Until the variable is provisioned the cells read as zeroes and
> the controllers keep using their default addresses.
> 
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> index 58158b51fe29..2dd09ab1d550 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> @@ -31,6 +31,22 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	/* BD_ADDR and WLAN MAC from the "MacAddresses" UEFI variable. */

Let's drop this comment and sort the node

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
