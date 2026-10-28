Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793167732;
	b=dWn4hwr6qNO3iTK+UOHikqvvQ0EIQRxxmLD1tgXW69Xu5IZjrME0bgmjS1hAh9ppbrs0
	 xQIkjxK64C5rDVqqedA06uV411KLpep5JGysAXa3btKW+VVQ90DgA3U8BVz3+MKvqFavL
	 lK5pvApEPwwrGtgvNhfCwz5anptKzKY9NKUjcpDctyhO8kiL4eRRXH6NFCRLHvHTLOSWQ
	 LbNXRdSW6KsSwPs4Oro1aYCFE4+ZpgNLudjGZ6s49VdXqsrJD1QobhN/EmCCoA8f9JJGB
	 aReq0hLJlMKIHzWR7SfUOkXUuSmCeYao/m6QJvtsiFlIX5atxg/tF6ZAbhuWbyFQPYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793167732;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uauo5EdXcDHHpx/dkq/cusNt5B6yHqZfuqoNAuipezU=;
	b=TNmP/BdCm5vLnVf5RZ7U5x4KAEhG8kgzDXjoy0//sTmkilD8bGqpR272ICg1BaihDaZe
	 eyPFE8EB06zItgE5IihcumVkl+e25T1m46cdx0UjOAqulzZ+NTIPIeWcCQysIfH/7g1Pp
	 ujs8GS+I8huDXXN4ItE3sSNMME8HZ22AvzdMvCOS2U3LGPzV4s3lpXbTzTxo5jAg5M+CK
	 ON9bbPUPQsYIMQy2tZCgU96iy6g5XwloLN5xXgNQfxwWVoSY/djHXL6ZHWV/SQbvXbGVD
	 8ZhC8L3P/skREjrB5pV+CvP9xQRyawj7ssy2bpjvDPuquXqPagofaQm+E3T8choMgPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cOuO7Gas;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GMEiLgWU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95CC606A31D
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 06:08:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C95CC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cOuO7Gas;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GMEiLgWU
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4PiV11134139
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 06:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uauo5EdXcDHHpx/dkq/cusNt
	5B6yHqZfuqoNAuipezU=; b=cOuO7GasIJQDmxJW6aX7tgMxZlEkZ1xq2eVbeLBB
	wxfIcm9jEyr2Qwv/wJ5bAxlJjEXvUhAN7x4Ub8wruvzLUq25a9jeDZaKoFadl3ur
	jaa7zXEpnUNFtDOweaskDDqvtMsGsB9AaWq9LHdo0tIjmfE3/s/yv/L1/kXextN7
	G8YUJS6lIRuMmi+LE9+ioRO1Ndo+hI2ewQShh1E7EtgtMk+ChlgHpdhj9P4F8Ku/
	b5+TMt04d9cDmpQ7yYrvb1ex1P0FUVWUIFzUtdy575jHFHScf2lZlIwU+Ja8jFd8
	IVt0JdtQh694kjn6feVAxQd/1lXQIzG7VSe3t75Azujpng==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjptm0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 06:08:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e9d52f684fso5940085ad.2
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 23:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793167730; x=1793772530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uauo5EdXcDHHpx/dkq/cusNt5B6yHqZfuqoNAuipezU=;
        b=GMEiLgWUVTzX2VJeEFMlscx4BH0YhGPJspTJvFKgB1tmzxqfdv2C8r1N29KqRzaWQs
         Js5e/+2J2c1BycTcOOr6hYbwgU8lli9129xe3mqRchuEK3l3VSPKuVlfAC2epJ396TIf
         BZTVK2szNZjZxA7Rrd5j4YAeZ2O1VcUpD/8BeCL/wc4vPtmu2ySSccPLXsmAJzkY90oW
         avzuLN89MhsE9qcN3Idq3p4xX9CGDVJboaPrnywXXAPQq5ng+Fawz2C1JwuBwmMuv/px
         VZ4EbvZIC9AJ2uKvBIRS/9Qq355KZ37YncmXVvCybzHhVBiu0b7JKXW7xBgJ0gZD5hxb
         q6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793167730; x=1793772530;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uauo5EdXcDHHpx/dkq/cusNt5B6yHqZfuqoNAuipezU=;
        b=ajHjvSAnn+jPj5ft6JE8sJ0qiLENsUonby8T5ZfdDzoAu0SHIt0GyJ9Yv/Wl5K28Aa
         maY4y71RB4DYHI2MnBo0cQNCCEeWAWAV9GJAcDG9uqmooL6fhJPibu07CqREy1RGuvik
         WYN3dbh0Kxv/VLC3rAm/kzUV1bWhzSno/r1m8KsrEHcs4KCdU+DIe3s9khWuK8fwMCgQ
         xm34IOJfKLgdcnjYZuKzKz7FVHFktZ3tGFJriu/T9vBgUljlJVhHWXyET/TEmRIB2isY
         Xnv8A4LJfHRVM9wdOcMWFSpwPbnvb57kHyRLH5AD/bd+jXCI5MQ3mLXuVeam/94uIMCw
         ViqA==
X-Forwarded-Encrypted: i=1; AKwUvBxfoI2y22ZMDXM0pReNNcOmEWPnkzPZPz1yvoQnbfjg5yfLpoayMxpVEClfHS31uTrvSaGmE8cpQb2v@vger.kernel.org
X-Gm-Message-State: AFq9FYIqTvxOOqrkQKMifUFkhSHKUQhQOcTSNs6o7FPB8dBQmyk9Gzze
	gqLmuAONUmLHELtjrROoDPpw3Ef5AfrpjYkhL0bpdGjRnrbkbnVjZ4NFddai1DFB0AkM3YNd2cV
	VELoVwMjn/iQqMKvKmsMuKVTRSlHJoygLZtYtVnxpbnyfimV4D/BAul/emQQlkTIr
X-Gm-Gg: AYBFou2k8s5VVdhI5/L34v5w1o2Y27XV96wmdbMfywx40XWCGn1wQkOvhH15e9LOWlT
	fY4VuLeWUSbXSbgrEyrV0WJzVucbskc6DDhuEyX6cxBa2Sg6dlg87n9/gZfK80VRpfihQpGMTp/
	EYfHoo8MNgM8/GY5ayuVs8OVhrL7IHwfw6GmSC1tVG7H7S1PZXokRb4P3XQUbs1OKVMP+QN/U3M
	f5U4JXmc8FhlPeptHh4CidZA5aFehWScflPYSubzwNI+JCUzyFJP7IiLZNF51H35XU2/uYQZDIk
	9N29dYffSWyVCOE8T1A8CtOGCc4lNdonatwdSX6f7iluRBiy4ccmN/C0pAXKVH2xyuMmZT0u+0P
	qiCLpqfei3GKBw2q26gYtF9vXwLUaf+XyC9viS5BhO7iz3AjvjpBiK85x2JfLZdYhsc4gx5/BSM
	NbVuFj
X-Received: by 2002:a17:902:cec3:b0:2e9:6788:937b with SMTP id d9443c01a7336-2eb0054cbd6mr14183285ad.31.1793167730192;
        Tue, 27 Oct 2026 23:08:50 -0700 (PDT)
X-Received: by 2002:a17:902:cec3:b0:2e9:6788:937b with SMTP id d9443c01a7336-2eb0054cbd6mr14183035ad.31.1793167729742;
        Tue, 27 Oct 2026 23:08:49 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bdd5cesm17410795ad.30.2026.10.27.23.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 23:08:49 -0700 (PDT)
Date: Wed, 28 Oct 2026 11:38:41 +0530
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Subject: Re: [PATCH 1/6] arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD HDMI
 bridge support
Message-ID: <auGRabyU1mLKsgNG@hu-anantiwa-hyd.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
 <20261021-lyra-display-upstream-post-v1-1-585caa39cd7c@oss.qualcomm.com>
 <b4737aa6-02e0-4554-91d3-4d63710037ae@oss.qualcomm.com>
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
In-Reply-To: <b4737aa6-02e0-4554-91d3-4d63710037ae@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAyNCBTYWx0ZWRfX6PT9cMbZdMws
 69mqMjM1InSpe9QcREEUvU5wwHhbVPe6+qiCnxKpfwa+mBmOVjsqEL5tswQMgWrpYj0pqVcNIer
 EgyKXAUbJDSj5WuMRmq/BaHyYoUgYYnDhcnHrFdtj/HOJEYD+/PwhdtBuE1GXuxxprYldCbGuBk
 lBXXFIXlk1sPz3+wb9T53cA5w9H4HToSbIvQTD3gwT7Gp58uFgXZ2tS5A//JEHPtLhsKPyii1Mm
 Inv8Ud5efL1933yDbX1BEAXcUkf3QzKN3jtTIqLrdJJqG92vQLSkIl9ZNSY1iLtSQa3f0BBwt8P
 /qvARn/2lvuBso7YBM8r5g1S6F4H6FW7fb5bffjm45byKpl+nzAjnvc+WQL8Cwk6LeHPpHDa5at
 q4cFnm1lCU8h4puI6jSU72PdQ3qbBLXw0sj+6fefagxsWgKfIuSfkT3fd8tcQameFkE6Y5peixv
 6ZCrAdMKUitBysv109w==
X-Proofpoint-ORIG-GUID: S3FI4pcYjgc-7nPIrhjyZVQKdgzcWgya
X-Proofpoint-GUID: S3FI4pcYjgc-7nPIrhjyZVQKdgzcWgya
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAyNCBTYWx0ZWRfXwvwNVJB4pQxR
 EqNPiD72hCcyNJHh2dNtAJd+mDZXUVbCYrshZfCDYX/qUOtN8OjMwe8mZBUWjIZrpHa9g4IJjR0
 Gk0k7eZ03HZsjpigicCkYXOnINzE+Uw=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae19172 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=YnGuxi4p6G6sd6deudQA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280024

On Thu, Oct 22, 2026 at 10:04:58AM +0200, Konrad Dybcio wrote:
> On 10/21/26 5:17 PM, anand.tiwari@oss.qualcomm.com wrote:
> > From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> > 
> > Add support for the Lontium LT9611UXD DSI-to-HDMI bridge, enabled by
> > default on the Talos Lyra EVK base board DT, to provide HDMI output
> > on the DSI0_B2B connector on the carrier card.
> 
> [...]
> 
> > +	vreg_disp_3p3: regulator-disp-3p3 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "vreg_disp_3p3";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		gpio = <&tlmm 3 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +		pinctrl-0 = <&lcd_bias_en>;
> > +		pinctrl-names = "default";
> > +	};
> > +
> > +};
> 
> Stray \n above

we will handle this
 
> Otherwise looks good
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
