Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462870;
	b=jESjdjYEe36lAaKGVbWyfdGbGumKBoFYZvaalBgBtDUFfEf5l3aYw//WwTD2nV906yEI
	 8LGARs5MNqx3hbdm47uJa1Vq7wkA36DeFtymXbautHU8duvZnwzT6oPzoKXhSKPLnE7Vd
	 puxx0MRHW/+8CTRPOuoLExPOxpfM+nC0Em/ZMv8hZnM1AiwgEHQQaW3WU4uKnrg01gtn3
	 tQMHCcyKT4hB5nX+mcP6Jig86g91pLCc/OYc5QxQkaQFZ7OH/0f8WUHa58OzaX6bl0ZrN
	 F17751DIkCXT/WLqA7jwihfjMOPSaF8G54/jQIiISqeZQGJ27pRbTPTkNXkQY/8E+Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462870;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=okCL8kgOe4YWBJzwczqiUxr3lV/zkclx0rToDi20iXA=;
	b=UCz/JUbb7wv9PJg4EVma8A6gp7xkJkLEwL6qJa7f5C8F1tIb7cNcyR8ovaqLT6PSad3X
	 uwpGvEm5QnIdwK6URlKK3XtYY8JwOJ0uJwU3c021FESx2oZuelsgAn/i98E5gu2EtyNwc
	 5dP4qGcdlUfWDCpnJ9dG4sZJnVGdK8idLAOtv5iLVJdgRZeU3wbRksBvwk0LmNrmIb7Xj
	 oxPjnjYLM8W37LZ7RS3Pqf76qRkjNZ2+NezX7EpE9OdTKNoUflaHefTlR/cw0bllsfjWT
	 IeaxuDZRWtY8I91hUZRz7NH2Uy/Wrlgs+rD1c9VEvdFzFTNwsXT7DmhHvIIHSKN4m9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="kX/EhceN";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ECmZ9v86;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68225606A31E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68225606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kX/EhceN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ECmZ9v86
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJNIvi3440215
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=okCL8kgOe4YWBJzwczqiUxr3
	lV/zkclx0rToDi20iXA=; b=kX/EhceN6e5M1VQxr5l21L+n06WZzx/2LLMIL5Ld
	XtIA/5riM2Jl8wuizaO0P8XhHrgtUOsA8yaZ3t6/a54JhVHAA/OLh8WiCHIXESWa
	hIGoueXqk0vHyoxCMbcbsgsdWZKyNmjQsBeuz5yVALNFUJKPfWT4rwUWdhZ/CGT2
	dQeCaqxXwj6o7inhvLyl1E+qhL8QzNK2yqtMPBT6744PH3eQy2ERUNGI0zPd/Sei
	F7C5J11ioBiCjGE80iTA5BWhqBXhMooxqJbOYhhL+yVn06Ak4Q/pYF49bARcWBlx
	6Thf8jHIuTWjRsi9e5Nvzsw+p/wSSaEBlFmBSXoac0ChLg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukr82c3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:41:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f33438950so657385485a.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462869; x=1796067669; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=okCL8kgOe4YWBJzwczqiUxr3lV/zkclx0rToDi20iXA=;
        b=ECmZ9v864Emw8K41zANur7AfoknTvD2anYVVgSItHzvrDe+PX+wVJKdisl9hLSvHIi
         +CAydn1iFRJNiuxvIg8P0diQLLTbErOSgcPG7u0Z8xokidlqezOwlEX3wCtlL3mCpHrO
         RFUEcM3YfxzoSI4tpG/thw605xHv3OBAGQqCIuzkdTEbuanDHSFHu2P+I/tZfueBqe0M
         PPPeTnxNPa5iQkouKfLtjRqvSpieQyoXdIl4RstSjPzHd/NrA/I3bqGd9Wu7qyy8YQBj
         IJIVFIz7h5v1vhBj7O5h19ZhCdsVLJyE09svRPg9ian98LhUZV0wMja2xxg/qcee6v+9
         mogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462869; x=1796067669;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=okCL8kgOe4YWBJzwczqiUxr3lV/zkclx0rToDi20iXA=;
        b=WESqfmrbuQSOKXs5/qoS+fAfRpgkUsMN3xPuRbl+12AjRFRCdH8uQjqRLxOp03NH34
         RThhUnHEo2It/EV88I4OcXewVjIHqzvE3urnH3Y/7k943vVKZA5GAJTFxBar7WueC5fs
         lBE6CtBQ+WlRIzu2cKoMVHjwJz07jsh6k5vyAi5vOaOmCWDXDC19vxnXTR7I+2dYDnpL
         I8XvjOFhsF8sgRN6GRSUCWxk6QTgbSveLlOrRHEatqG2Barz2dOp3vs4c8aya7SOkUy/
         awrDz5jGbCAQD8VyN3clQ94jZoGX9Av4K6N7UtsdxYnAoRoJbKQC0B5ytl4sxdoSnnk2
         22rA==
X-Forwarded-Encrypted: i=1; AL+hErFnWXsQvyQwRS/r6lxMd3MvnUXTe6OW7l5BIjJ8kj8c2CDW533cVV6xMBBhqRGwGyO2H6cZxfVYRZox@vger.kernel.org
X-Gm-Message-State: APuU4Z+4h/B/I/0viMSOeLc4hkc5oNqvBkmVZ1ay6e6voxaOmcW4hTF9
	g+enoo7FVdOv+65fOABDa3mZIXC25/bI/F7EapP6vcssgPFkfHC97MmcHL/yhha2SkoOonNyk2s
	M+LGCVdPyJjjWnfea03zpmFlWedREJ887TZpfk/eRihdaym4XcKNMsx/EuWXYbOFa
X-Gm-Gg: AZFdTZfw2uuS3ylWAtG/6kGFq+t+JB4CQ3R6jRwS1Nak+pLfGHkwEjgSJ/kf8+005sa
	Q+r3uuaeYvwkjO2vFPYUxf9hpbEvlGurVv3y0wOrcRyZSCtRUt8AjiZD+Q4r3BMNraDV2oGTJ48
	gJKQwVMXl+m0AsdWwDxaAmIxBqJ2yZcYV0pVCIa4xryK5w8mgiu7BTtbks+jfyC1NKfb5k8CtOM
	BzN1Ye1lITq4BJDdIbgB2mddPnbs2TKEBfHryPcb1hm/aawnhrmlOCsTKimQPjSs+3tlK7ELdby
	AL19tToidTgLy4JyV8IpfBdngqgh0Kn9aidmmGuCH0LSaWfbgvz/DoHN5DSr6qUJda+dP4zaGKA
	+7qbgkGtqqki6nJwkRy6xlLETns2q+iS7zOT5BgzU6phBb4ZNniOvl2IESqxSbGjC
X-Received: by 2002:a05:620a:8812:b0:949:78c0:e186 with SMTP id af79cd13be357-949ba95de77mr2032514685a.25.1795462868586;
        Mon, 23 Nov 2026 11:41:08 -0800 (PST)
X-Received: by 2002:a05:620a:8812:b0:949:78c0:e186 with SMTP id af79cd13be357-949ba95de77mr2032508985a.25.1795462867959;
        Mon, 23 Nov 2026 11:41:07 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm490807405e9.0.2026.11.23.11.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:41:07 -0800 (PST)
Date: Mon, 23 Nov 2026 21:41:05 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v4 12/20] arm64: dts: qcom: sm8450: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <lljflqhizl3wlw5pusaslpxwmfe4taxadw2prfogsxr77voe4v@ggolvdeja6op>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-12-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-12-be30526391d9@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXyjoHHG6IMDZY
 Pg9DYk3qbTM4A8Q0ZYTMyFyFUyFYov3/9fr0f9go1xJH8IwSQqdXDhCNGQTXm/DM1pKH6jcb9Nd
 SKb2zY7mqAoBRa0+6t2qsl0YyTUuI3g=
X-Proofpoint-ORIG-GUID: ayL8F0YLyjBEDN6AcVKX07cWk3BLnVli
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b0496d5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=jAy75CqWmSRsgNc4pWAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX3NdyhRfVmgLk
 ymP9MjUpVZRfd0LGP4AQypcEng2i5ztE1CjxGADbE1ynsAyo+p72zgsK2guUnKulI4hL9owRaJm
 enloEFHa/LHEN3yvpBoAs5VznifhF6ltdTWxLcoA8iUjTevECn0yQF2/ut5eHN8b9+vgSmHE8mw
 TUQoYnaxFCgb8betKa6EgY/6+cf0gkmT0ewUvyZ7mZXnH9cxxxVQD8YYm0pAqXMlthgpGe4Yp1s
 gElArMyQa6fMHnvwFh9kJJBODVGcymGykMaWF7kNga6XHXWl+wYZlMioOY4dhIjDOk1xy5w4ncA
 ofFgt0aGBN7O092O19pWQ3aG/Rtc1Ti3/o8l64xaqu5oAdKYiUy4uYkXALkGeHCNaEq95V2JOo9
 wYUpmJBQhtnEpctC9PaMQmW0PnYrBw09Ss4Ed9/iJzAIFPyTpkzrPhk3+41hcjkU4pslgsX314k
 clcHBL0iaJ7ozzg+FPg==
X-Proofpoint-GUID: ayL8F0YLyjBEDN6AcVKX07cWk3BLnVli
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:43, Bibek Kumar Patro wrote:
> On SM8450 the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
