Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A9E48425C
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764383; cv=none; b=FL0bgTaDdYFzQkTOeA2WR4ZVQj08F3xY2vUwymhQz2k2gFw6XankKyW0pzvW5qj8M3b9G67zTtqm6DtnDBLuyY5flc8KS5QgZE4426uZyFA2FQ1DDIxbTs4UzRolq9l2DJZ58P0v1mQChD1DCo80eeqozD7wED9pC+PCBYFXsLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764383; c=relaxed/simple;
	bh=XJqq/HqfHJps0QJpX9Yh5Stodb+XN2Bv1jNcqRvC1+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pcPXgJ1acxrOHC6clQbEoZXuvf7P1wIDducXvvtmRGNPmOS9DGInsog+vwm57sypmLby4ucowIVAs4+Cx46FPXDcTcY6gmqhC+Ov3Y5msZSbX0rCh503cU+Xmk0+IftJFF0iwKPhbaCnSqLM2LDHSzSQ4+Y+cKD09OhZusNdg24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GChnVdVm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xw0WtRwQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GChnVdVm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xw0WtRwQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dWBh2667041
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:33:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oOS8cWcom7zKihTK0i6yF41CIgFONzu6H2go37Q+AJ0=; b=GChnVdVmku6RuTmC
	1fJ2DDWjNwhRb0XkKRKojfl/OySNJn0mjLQjytrD0jyPZzWYmQjFT/+yw5pQf80o
	mT+EXEMKTxg1LCpst2Rg7MY2GArzBC1naM2AfI5dSc7ugCfHOE9JNxoSRJldTx/L
	dTBAUyyDYKneeve+pienZb22d3Tk3FX/C7vNQ9F+S3Ytdqb2vpDXhIechrUqaAhE
	9ganUWrJY+2Uud4gFJFhErbj6l5c9Q0Ge9USvjeic8BILUZigEjcVNwQCp/I2FGG
	/Hf8VP82BS5k28cDrNqRa6PblVvCu+T7/DIpgvoELCFfDRe1Fw37qce9NBktCBRL
	AU0eiw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x27gtvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:33:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-532bad5d751so6184521cf.2
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 03:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790764380; x=1791369180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oOS8cWcom7zKihTK0i6yF41CIgFONzu6H2go37Q+AJ0=;
        b=Xw0WtRwQpmCmCg4z4YGXHbq++JWhTRBMG8YxzVEbTEO9H9aBX7AKExrJfZ0LeDisbE
         TGTcu/pJtgJ9MuyNcRsTY+CBc5kAQrV3Cku9PBYJVYwMiuqmj8ynvVz3g4SA1NYDMIIq
         38jA7WLWjXVmoRBcTY8i/BUbsEswyqb1Er9wxCWPvDw0e1nV9+1brbvIYsdQqJwU6iZh
         kYH+WgIQrUvV39C1BAnWOLiCwEPb/9Df2NlXtWpjZgcdzEMDzpSE9ZYf6sA4t++NQnLB
         1htnJ3AuLWCp76fzxRPgx50eOrPYAVSohRPfmjW/RNUsSiRgiN6NFqQG1SX8PzpzVRx/
         cA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790764380; x=1791369180;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oOS8cWcom7zKihTK0i6yF41CIgFONzu6H2go37Q+AJ0=;
        b=SCPGm17iAqsKWO9syrLnqXpQ0G0rbb/Lt1fKquXf3UbwabSJholLyOr0k2rGXC4uh+
         qMdTPmIrkCcG9WktO1bllNAPhoFcB+4LIle7axmHL9lT19Dbi8Xvuy68mmpa3R2iYmZL
         JdMr83Iz00XzbPl0TVtxeeAhWCLB06paYtVdLIX6vJnVotQHtszk9PlUH1l0W3Z/h0a/
         DBOdcRIHTTPISGtJ7/Crpc1UzDKLtIIfRORtYx/GSFPgvxuzjr623mpNH0D8TCBNLG3z
         064Rm0QU1f55WsJRgSqnlwzvVpdis9+23Hsw7gWzlmMP9ccNHIfUkVQa1TWI1O/xsqmS
         JP/Q==
X-Forwarded-Encrypted: i=1; AKwUvBycA5zP0x/M528ys3BWSP49a4L0Ev33n1XnWRNosov4KKZCUY9D64Nm3on9pljLdLtCxmEWZ4Dv4Cje@vger.kernel.org
X-Gm-Message-State: AFuF++nag0eYWdNiithz/bnveeC0RTNfybitJfJgwWc16bHFKoZA+tFS
	UMZKUIknYC+fVzRoXLEmpyzlNEa6jLmnb1Z/PnhXX33I8Vogg+lDKO4X8E1TQFvizgb0AqdzVv0
	i1CnyIrrfSw1riBs2wbvLrXPW8Ru7/3EBAgV1AVKlGdOGRpZsoyLFYlPkoy5nYESB
X-Gm-Gg: AYBFou1OrelSC1u+EaqtxFYCy2wCmJG5FXPU5swX8q7OLtH+ZxDECSve1Aj5G6UjgH2
	NskLY4la0VnCaj/gaIuHRxzGhLR1AhMAr5iHvKLS08WeKJo1BtcDFmeITP1Al46TSRcwFZndA7J
	U3K7O0J3pVoYbTIZNt7PDXOTNMdRP4fpgCfSjuSgX3d454/ID88xo08RNVN64WPoWdRGWs8w2gN
	leSZd59w+7w4grrrjvvIZ1i+OEEAgZciOWqvhpaMklrUgg+EpZ9ZducT3iNqcPVHWrQurDatSLT
	+qbtUIbliJX8UzbPCYgAjRJ5ok4+m2AILU7B49+JBwsc2j8imI2H8rAIlzmKPquxvL0FjOuJNSs
	ZjqYHe5OSfeoRhSSzmKjXUw==
X-Received: by 2002:a05:620a:260d:b0:93c:6e1d:96c0 with SMTP id af79cd13be357-93ca96ce16emr134797985a.3.1790764379654;
        Wed, 30 Sep 2026 03:32:59 -0700 (PDT)
X-Received: by 2002:a05:620a:260d:b0:93c:6e1d:96c0 with SMTP id af79cd13be357-93ca96ce16emr134793185a.3.1790764379143;
        Wed, 30 Sep 2026 03:32:59 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f7f26asm44710266b.42.2026.09.30.03.32.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 03:32:58 -0700 (PDT)
Message-ID: <6c081871-6799-4ff0-ae19-187d8a6f9d9a@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 12:32:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/13] arm64: dts: qcom: sm8550: Add Iris context bank
 subnodes
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-9-0322ca5dc10c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-9-0322ca5dc10c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfXywUCTgJr9I0y
 CqNgDVSpY/uYJTWBGOVwGExZE1uxYjAk2BkEmOtATZTpQn8jQx0w/DACGyY5y0EJPTdwvoo4zfX
 eOjS/RYcQdL1dW/yKVSr4MjoA11+HLQ=
X-Proofpoint-GUID: VegQ8yPNnJWgFG40RCUeVLXoU8toLyDI
X-Authority-Analysis: v=2.4 cv=W9GtxhWk c=1 sm=1 tr=0 ts=6abce55c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=G2U8quZLHxfXJRKprjwA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfX25Jfr/+XBU3c
 XDHh41/v2JzlD4uNm6/krV832Apv3Oe9xvAtqBdA7gJMvG+tJPB3T1Ri0dfONdCp1/zD0Xp5q1S
 nciFZfxQ1m+7HgeuLt/x2vemeYfSP2uOvEBz8YN3xfqyyHj8gMqFw3elaf+VAEF3R8x3MtFd5Xg
 p56QmugZdjBvnvIGE65jaFB1xr7HrhVHY16xTlITPQE4co6c+r1oSHB9NOy1Aym+ej4X+PrNL/E
 V7Cl1Y7ueFhTbKXjML8ptqTs2/IHWPcsEU4Kp82yq6LwXBGGLGG45ci8yGCfsGEMAydWhoGDrBy
 baEsfR+9lssP2rC4T2puyenVF5169WT+4jAKcZgoHIhSF/owiQMCUmGLo0DGzW8c7zVhY4yP7jg
 hQbuI9PyABp4QTBR89wvlo0+Ik4JGA324X41F0cLDQwh4arPcrvkOPV5KBL0KD+IecERUsbr7BM
 uiAltTWREiuPFua5Hqw==
X-Proofpoint-ORIG-GUID: VegQ8yPNnJWgFG40RCUeVLXoU8toLyDI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300041

On 9/26/26 8:34 AM, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> cannot address the low 600MB of IOVA space, while the pixel stream can
> address the full range:
>     +-----------------------------------------------------------+
>     | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>     | 0x25800000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
>     | pixel stream addressable range (0 - 3.5 GB)               |
>     | 0x00000000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
> A single "iommus" property on the video-codec node puts every stream in
> one IOMMU domain sharing one IOVA allocator, so nothing restricts a
> non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
> that boundary the hardware faults, which shows up as unhandled SMMU page
> faults and spontaneous reboots:
> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> 
> Given that the address range restriction is for specific VPU stream, it
> should be ideally be moved to that stream. To achieve the same, a subset
> of streams is now represented as subnodes, so that each can be
> associated with its respective addressable range. The design was discussed
> and agreed by mainatiners here
> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org
> 
> In the past, this limitation was addressed with an iommu-map approach,
> with the iris driver dynamically creating the devices. That approach
> was later concluded to be a hack to avoid having subnodes, and was NAKed
> by the iommu maintainers. It was discussed in detail here:
> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/
> 
> The video-codec node includes address-cells, size-cells and dma-ranges
> to declare 1:1 mapping for DMA translation to the parent.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
