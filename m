Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462910;
	b=P5wGFm4amMtpiG0KW8VAIgZCVikESBOSEBwlBYmtXsIrRFIkcdDxYYQYtDo5ega3JADb
	 RMzVkTD6ClFNOaZrrfu79UusApwz4xzHiwJUeuk357Cg1TR+dC9jJxqYfJ+afYS74AGUg
	 VqorZGwpmUXq5ml8DL6R/RFrh45bPMc2ZHv2MmbYKPU9Qlc9aQDwdewkxBEUY9nJ94ccT
	 08BUR1l7ZRbHTwibxZmnF8VkLa5CAqqt3QAMmAv2e7zTaRQINdoIWz3tDeL3hyRJ83Bwm
	 WMv7sqt9EYlkDBidYlA8DvpjrksL5ztvms5mIWWIDu1tpKP/4edhrcD9F5KPC1B8+YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462910;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fhajorqknMVWTu/OeYgSDpH4HYLQIjY1Z2rYoHbqGco=;
	b=IeP8GCwUBtyMdPN2sVvJGG31boddfWh7AGYxmwkAEuf6L6dcE5jePiIn/SNYir50J3bW
	 BWIqqbGcMLRczkUi9Hn/dUBM4Y1egSSVm8w7Y8w2moGeSOQ08G6aiWPZGHTyCtNPU6Nqi
	 2SEA4Nh/HCR5Gro6G7y+7dWNno8LdNNs7Yo5yeadoYYwuFpvbgwxf8S/3Nyr+CD9O1ojv
	 rzNMjArCLeGY5OfOeEiBjCcmqSWE2CC1JtWW0DQHxTAVIwrRf1Ju8YNmhLQWKAXE5gUhX
	 qS23UT8FINxzJlgf2cWvyDJMQ1zCizanao705tnouDAm8JsGhTrgslPitfmCMfSzzHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a1IV8A8d;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="KS/fv4TS";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA25606A326
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFA25606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a1IV8A8d;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KS/fv4TS
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGlkK3730134
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:41:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fhajorqknMVWTu/OeYgSDpH4
	HYLQIjY1Z2rYoHbqGco=; b=a1IV8A8daf95qZ2Odpglrdwrbg8g+pmFIBoDfUk1
	Q0hFEqYN75XFdqNfo6dwlXNLnzXuupGJiWHsupkEx++C6a609ZowOUiGrbl0OMw+
	+prfpJWpQqZOjBBYexySVC9ukblS8varamMvEPEeiLra1Bc6qe4McaS/VoBMJr6R
	a227v4puWMSArvQL7YtxaqByK60q22kvzZePpGbI0wRB0Y+9hCH6vmhL5r8Vxc8w
	QAVi+U6rMANRi3mpcjSXrcg6gUfgGfjaZL2WHPia4wVEI6qDoz8NoVMASTBNyd/C
	FAB6qw4wqzzbccvlfLftF8PZQNn90/71gkTIJ3qNNB43Ag==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd36eb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:41:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so696061085a.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462908; x=1796067708; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fhajorqknMVWTu/OeYgSDpH4HYLQIjY1Z2rYoHbqGco=;
        b=KS/fv4TSwsZZYV3TrdJVO02d8FRjg3rHLxxFtd+kRJo0rJW1kZUUJVo7+Q8L8CRNdq
         zMv35/8LGT75VOeDMfMeALfuNd690Wjtt6XamktZiFT6MPh6InnwoKeuXeKzsC64+17A
         4uZl77ymooMe6+7m1nDWuiSGBWcob+sS+K6CpzqKQxr1/43oZaCId3bjqr2YTSV9ZkZL
         ac3yumDqWSOsz3In3JcpRkTjJzqY47ylVLre0HvH2TWTTb9jFc/7EDSRFWwRrhdivBqV
         RS301le0s3QO0bk6tpW7xH4LtdTm0uvfiSiCyCO6049mXsLhINAwzHMIPNNO4S3PeF6b
         lGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462908; x=1796067708;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhajorqknMVWTu/OeYgSDpH4HYLQIjY1Z2rYoHbqGco=;
        b=ZnXjMjVgVG6JxTj/p/ZxU0vmvAkbRLRO0/Ijh8z/jMaLLipivoVM56vw9ppGR1TJws
         7SWREgY/qST35XCjTQzMbUl/cmZa13cDKuLhQf+eSy/9QqZA2KBIfJHHVa+4xm5trUDp
         MebWU5fivm1zMvQGIaPe4Mldb6Ow0CH55ORZgavfVaz+OUwn29PtEUJKfoxgaaqUa2Dz
         bMWUdgFaTSHx58UsBKValxK5Il5Ry52OWv9Uukf0JrNPIY1EZyMMr4XK0qgMPYlrtXst
         obrf5XHECZ8e5sLI2XrCBJ3vadLnYClypu5vQ/GAKG3d1npnEk4DnYlMHRNySv9DKDLn
         w0KA==
X-Forwarded-Encrypted: i=1; AL+hErGbEXv1COajzAjrYQHzHl7aX561mbpRk4tUV/pEkQjOGZZYdkdp9v75wEiIdKr+/so9ld2JxaRBNSvj@vger.kernel.org
X-Gm-Message-State: APuU4Z/01UKA4V1ILwDYqNMLf92tjoZiuXdbCtu7RuQjIsVv0+vvMqEl
	ZkZ+Eu0tYwg2Lhf9zFuoUADlm2eXRk1phaNHOlVUaW7+SJL+CrwPv84aD2wvSpkax6wFD6Nc6s7
	2AAtzzzHytyQ4nQ5q5VDXotkEy2kVgRkVJoAtBuLq7v5FR/NgS7Ia7vis6VvvTYquwcA2Be8C
X-Gm-Gg: AZFdTZfFdOxlUSuVFD3HdfQ3eqKyu2KSnwPjBKITrHoMtFQnT14TvhfDMlWhcOULEUq
	6wQ9OYriaZVKbCLQrpb8Alh2o2LPUqi5AYd8urfzjIAk07RcAjqsXwiH0pwGd60p9cbRPpu06T4
	o3cxp9ow66sZbFZJH72f+EnpEW0sGsge/eO0V2nfFW8e9vl+1LtKUMoSKQNcVdEU9f1fzQYt2FS
	9mGBv4oeQei2Sux6LYxru9ssw+hSMxkzXOZyGe9Lm/KG9vakNWT2w/YI4vIVKMQPKwxyK5913P7
	AIrePJGFvh5CA5KG9OH9+XNk3PxtoJ9BFH0GLp/zCiXitIg3dp7I4BuQ3ubUL0JzA66Gp+YL/xc
	yEwLShBpagx8rhU6+COip8U2kNtoVW/5Ns181tRzWcQwiQqXiez6VYZU8Vx1fk0fv
X-Received: by 2002:a05:620a:132b:b0:949:52b7:468a with SMTP id af79cd13be357-949ba9e0e0bmr2222151185a.51.1795462907711;
        Mon, 23 Nov 2026 11:41:47 -0800 (PST)
X-Received: by 2002:a05:620a:132b:b0:949:52b7:468a with SMTP id af79cd13be357-949ba9e0e0bmr2222144485a.51.1795462907102;
        Mon, 23 Nov 2026 11:41:47 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm535153725e9.11.2026.11.23.11.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:41:46 -0800 (PST)
Date: Mon, 23 Nov 2026 21:41:45 +0200
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
Subject: Re: [PATCH RESEND v4 15/20] arm64: dts: qcom: hamoa: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <q6s4lgilunj3pikw44icbwuwq3cdlk47uw4lg7iyww6eaolzie@vaux3olznlsr>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-15-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-15-be30526391d9@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: aB6HVxWuQh2T0usWuKqllPxPEyU4e9jf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXyqcD1ECSdwV2
 +BueznGLFudl0FY/TOwkBGWETT1S7QF3ml7EEtbNeTtDOZ7XGV14FDHHIC8SYCGwUG/UpJ7+dCt
 Be0VX9dWXHeIQ0j6m5cd1845ILh3p5dgePM75l5Nk+EseH1tukwrgAFFYBkS5GnCTe9JqlSmpza
 GhfTlUDTt+ypBMGd8qxh2B8jhPYcGlDypiHSL2bZtUahGJodwg1QArlbof2SZbzlYcX+E1+ud2/
 PwwEyzgDgAkjwM2LpIpq0z/0BjxTs04Yg8V+N8GFsMdOkPpm3VrLV6uUc1EEkswiSf0RDFTeIQD
 DOZnZV8LbpPrPck+I90ToRrSWehxae9pNVJMiVcfmeqcfJD/RdlavuCfyCyDgWE7fvFx2G8aIOt
 Uyz1kELO/9+LQhxA9XxsjZxhHQMym2ujWHqmjEr6OS9bL+esTsfNqHE9eR6r7kdy/Wx9huoMzB+
 nTx3uMYarLCIIR5KoiA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX8DWnJIyI25Nq
 12btW5gkQrV/f6oBm3+EduB47W1tH3TDJOR9gq0TjKsJhWv+bjt2kbprvZmn+owV8NEVMtVIiRu
 ZFU2/C7h4ORHqLNyCZUpNML+4t5r5TY=
X-Proofpoint-GUID: aB6HVxWuQh2T0usWuKqllPxPEyU4e9jf
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b0496fc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=GtCB4xAyANLfO_zL0oUA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:46, Bibek Kumar Patro wrote:
> On X1E80100 the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
