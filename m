Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591605;
	b=BCeNMfOQpctjGyew65o8hodxTS2rGscTZSJzCcTdZ6nGKgYY7cmOqjeVDNWYdHAXLBkS
	 /bRonCcDudjE/qsJGyXTQgpbN+P4qi27+kVuJMwA1/TG9C7RdpLBMTb7uFIYDhh3/kp3r
	 aWVK+6k6tbef1mm19grGkfeBmLUlnjMpSl9j28aBUjLA1lmCO657l9SGxxGFcWrjBe1i/
	 NYABe3jB7ZezZRc/RagZpFgCMamSoQIH/jsrj6dzeKcrSHSZL1Bwoz6YTPof7LMoUdQyQ
	 m3YTIWBL0LIfoYtaMpeJgypOoRqeHMzVxqGNYwf67qhNC0lRTsy9TXr5o1PbCjBBALQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591605;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cER6PZfE63ZfwyWNRlY05y67PyxrF7hthCCcku5wocM=;
	b=fp0s5xYWNToLhfL4gmLx19lnFT7YN+tCQTEFahIrLEu6zqhrS5t7gvGmtutU0ip5pHb7
	 pOKo5Od0N30EzQLqDj0GD4EyucAUkmR0tjYVqTfbfZPfkQ2TdbL1dZ6Hl5FyGbS/Wp0J8
	 NfuXjnc2fB5ytdRVIgCr1jmW0jI4GyURJLh7oBxYMctdxnihkvtncPo5JfPdhhIJ5/Vmt
	 soW7JEs8iCgs60xOmZqTtZnL6yqoozOh0gRI8Gu1joQySPAsmAP9WKj/49txkc59sT9hd
	 5IucaVRnTsMfgFOXxnnWKwyn10xF29DRPfgt/3bwc3PAWMRnT0MLan/TdiU/rlwA6Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Adlyp3EL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UzWpeguv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16E4606A31D
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B16E4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Adlyp3EL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UzWpeguv
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgL3O4168133
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:06:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cER6PZfE63ZfwyWNRlY05y67PyxrF7hthCCcku5wocM=; b=Adlyp3ELYkFxysWG
	3RVFTj5LBb8w4ZBV7I2s2yUeBtlczF6YuA0iNy87MMGeGqalnyv/IbYCWMB1vmkl
	Z/eLhtrOTtq5oMOBsTiCOfUwObu4cU7SerYsgb07VQC2w3JpOHqpgXR0y97LLHrI
	3cgKS2PwO/OHcIUnd2H7WPGsTagh02hD5bID4/pM2VhqhFAt1e6QTlXRCWP4q016
	KXZ4Z5jfBgXQh1rFW9xTPwyvtH8BIPGWmufEetif451xR5ax5d/h2+4ObDTmWSXH
	DxPbQT0K0Y44R9oXurNEkhbmqOk64/2IgtmPp3gKb26SfA9Y21eObX9B8TYy4MSW
	K9zmBw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0m9gg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:06:44 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-988bf286521so22143241.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792591603; x=1793196403; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cER6PZfE63ZfwyWNRlY05y67PyxrF7hthCCcku5wocM=;
        b=UzWpeguv6FsfUh/0TnDvYebH1kzVmkID1zsEbawjqwJSvpcF+5h1dqSZmgKGfyOG7M
         j4mLmxhvDhxihQFfDcWFx7uWhluE/wxYQqWkTAdL7FbhRHw0s57vE/tZ7oiJDXRsyhop
         auichGK+GCAPCnEclqCip8gdpt+I4mar7UVxL83olscf3Oezn24S0oMyopQD1AGU6o3M
         ef3yS362X88I9Z/S3ieTnwBikKlz5cKbu0g2ufAbJH73vIRmJdHgPCROO+E5kLD10Non
         P3nq5BAOG5J0zZbE/a5xuTLc3j4Y44HuxcerJVn8DQOaO3fAdNWyEGloaQ7oYgUB2z75
         WZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792591603; x=1793196403;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cER6PZfE63ZfwyWNRlY05y67PyxrF7hthCCcku5wocM=;
        b=PAmlocvwoxRLVGM17j1oB7uKCK/nihg9olaX+q5M01vzBmPOsnjUGHtL4/4Od032bT
         ThXZFbgk/I9MZKxrR2FzbpdWGIKCC+UwJx8HMukUsfCjr1Sf6V0ahQCay3gP8VgcOBys
         WxVXU2E6AqK/qNMHGIWyj7pHU8yl1S9eKx4y4nVvNyRsaPWUJttrSR9Oi0AW3kejQuDR
         Y/LmJUyUnXSz/Kc1wf6j/2uBcRCArvh8e4OJKv0Uz0n0CZffw0XM2vkTrKyS5CQp3SVn
         5GS5aIz/tvUDx8NdgbSYX0dco6j/979xgo2pMveGyN4RgDYiqYo8DCZnuq6djyjOts/B
         18aQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVodnplB3Ri9j/iQM3+bT0W/4pTGtyTKxQEHlxCba2ImcYdqsd1ACVWqVSTBOAxwYJpy51cokuL9b8@vger.kernel.org
X-Gm-Message-State: AFq9FYKd8MnvpVvZx/VmaZXhN2TwioYU2JZWIFcG6HANf6ddvAEtnI0r
	1bp7/epDbdNUE2fku1eNvwr9UO5MgnIMo5k3fXnqT5b3zp/zFCULuh2Kn15OMlYeqHoH18WmOTv
	AMQ485e5PDfOxNYEK/oVQeAqP+uXoBEkT6iwRb4Hc4XItBk3bzVJmZgqBlMIN+e0+
X-Gm-Gg: AYBFou2FGubCsZ+lRMsfKi1Di4U6FCSkYDv7tZeisFrw4DpZ+rqgqW9/UXM/fsm8piZ
	T9VcG28o5VXwJ3ES7KBN9315o1mSK6h1lxFWhcPAgJL0CXNBnZzjLcNbAa14RmYssoegj+ouHcK
	p3yc/5od7uVusAicSdpo8MMDXReZZYwkYDozyTx5Jb1bzLJez+IPrIKY5C0O7N+T4InE7YAwQTO
	9ThweVfbijUxSWWcd15RvYhdI/Nm0yhixNRaaaNPWFrpkVRfyE93B63vLkvB7ioTEIEenRoFP8V
	bPTjC7g0w1SJh/xi0aIA1dSXN/hzcYIzlurVrjWJhpsjjQYg11lXhU4NMSyPT1VJnUaTBaNkL4B
	OX61zzjzMnMcfjmgcrVE6eg==
X-Received: by 2002:a05:6102:2d0d:b0:7c3:83a9:edb2 with SMTP id ada2fe7eead31-7cc9244d5f4mr680888137.1.1792591602794;
        Wed, 21 Oct 2026 07:06:42 -0700 (PDT)
X-Received: by 2002:a05:6102:2d0d:b0:7c3:83a9:edb2 with SMTP id ada2fe7eead31-7cc9244d5f4mr680854137.1.1792591602276;
        Wed, 21 Oct 2026 07:06:42 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a59ac2csm7665066b.51.2026.10.21.07.06.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 07:06:41 -0700 (PDT)
Message-ID: <5d3de423-e5e0-41b6-be5e-c1a46e53d570@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 16:06:39 +0200
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur-crd: Describe the PCIe M.2
 Key B connector
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261021-pcie6_fix-v1-0-ad37134c35a3@oss.qualcomm.com>
 <20261021-pcie6_fix-v1-3-ad37134c35a3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-pcie6_fix-v1-3-ad37134c35a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NiBTYWx0ZWRfX7S862Vmg1b+m
 xK1mtYrXWiPSg/7WUbybPF00mfrtpRGS0eYAuKjb5iHdAaxr6gts2mx/KjHZak1C3ex7U1gtGba
 0LWWAwCLYARbRNDES3al+5TjvNI/CChx//dmUYCEeohqx6DhvIIcPh1edqZfOdENK/KbXKzop8w
 qCx5l9Nt6StqW+U7TkbV5SWeqc2+83/JipE+F4lLVURW+Jdse9TTX+R5/6iQ11KA0wDBlQrMp4r
 KHPVWIfBOqrAq7S+wZgWIeHRrgGl8Xh3ZKsjU24SjDHiSwJdLH8K6Dr4oIWf//Wnfn5rtI5jp3B
 ifKMoI3B8jv5X0ANUhCPEPMy56BSSTIfc107AXI4Hk93neXafJXYDu9qgAu7x80LwAqwHO6aq9A
 ygw9/hRkhGY2Q6PSNcuwG+8uCC9iRjMHGkEsoeVmV6XbkefYSNsPYsnQdHv9UjnDbewVEPbDVzb
 Gid9CPoswiFVcaAzDQA==
X-Proofpoint-ORIG-GUID: 8wav82mKlKqY1gHDrLalb9dHt1kaY6fF
X-Proofpoint-GUID: 8wav82mKlKqY1gHDrLalb9dHt1kaY6fF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NiBTYWx0ZWRfX9gkULDz+T28d
 erdFByxJiQpMbXTWj1DlSJMmxB8sZiwbp177YRrrrYdYVPw3YJH8IWYEl9+pUt4L2yx5l2GjnDm
 X+V47JpzAQ3AjoloEwpDAmEr4U326Hc=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad8c6f4 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=WydMKwGuG-e24Vm_Hi4A:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210056

On 10/21/26 3:51 PM, Krishna Chaitanya Chundru wrote:
> The Glymur CRD has a WWAN M.2 slot connected to PCIe6. Currently the
> vreg_wwan supply is described directly on the PCIe6 host bridge. As a
> result, the supply follows the PCIe controller power state and is turned
> off when the controller is powered down, regardless of the requirements
> of the device connected to the slot.

[...]

>  &pcie6 {
> -	vddpe-3v3-supply = <&vreg_wwan>;
> -
>  	pinctrl-0 = <&pcie6_default>;
>  	pinctrl-names = "default";
>  
> @@ -828,6 +847,12 @@ &pcie6_phy {
>  &pcie6_port0 {
>  	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
>  	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
> +
> +	port {
> +		pcie6_port0_ep: endpoint {
> +			remote-endpoint = <&wwan_m2_pcie_ep>;
> +		};
> +	};

This is already defined in glymur.dtsi, just reference it
directly as &pcie6_port0_ep {}

Konrad
