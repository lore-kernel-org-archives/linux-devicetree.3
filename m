Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516152;
	b=H1Rhs4OD4sWcaiokwc875eZxujq1vQL6IQKUFDlbajvAj0JE7Vsupgi8VPD4vgDhZy3l
	 kHwsTid3mHVqiMzvp9fO4V5kUA57I93sUzk4wp9fGZFqwfMCW7JkJdupl0F1jHZYul/4B
	 A/ivbedlnbEAwxf49OudK2szFmtYl0B9R5PwByMOmoA0ASF1igVVr+3jgSIIVHXl86SH9
	 Ck1csSOtCEIYgrX8Eeuervxi5jbC7dy72m7SWNZUQGeG/gpTuTtVGwxQTssPVq1tZRds7
	 9ruif/8eD15FspDKXpZLFUo+rNgqyGB5TtqoVpf7+6nTU5x011Gbia6CnjiynHnC8tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516152;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=isq1BtOcwaV6k1B+5U1NnLpldAIjmTJ+TO6ciHLOLmM=;
	b=IiZ18uRmU+hJcb93Pj0VM/Bx7ofRgse1UEiCFlVMsMzJNUkF00VP3fniQVoZ4z7cEjjM
	 QK7SiLqoh5vY2U2+9DQpfoJmkgNw8H4bu95IKoODuVPx62eeOftaGMsXCqyi/tT+SAlLe
	 8sxitunXr5Djlyjd5UWHrNlxHSYRlk+F6Cv39EKeSzMGwE98ohwvar15wZRAY0npgO/oZ
	 FffJOP2iyrEsvcXtcdmteAjbRwykXVRcaJEW3lY3k7s74myU6IeYcCfnxLdvyZRG4znrZ
	 6oET8kkDI8UYdxyUb3vRQbmThDQlOQdh0HKZtx9gpFOyfNL3FRUQtb4VQxMSpeaseqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N8ZdrZYR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hNjrsOkr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F13F606A32E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F13F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N8ZdrZYR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hNjrsOkr
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO5m2Td2848324
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:29:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=isq1BtOcwaV6k1B+5U1NnLpl
	dAIjmTJ+TO6ciHLOLmM=; b=N8ZdrZYRTl7zB7gP1LKPgniw4ZznMWPBcr9GFT0b
	Fe7H8LGIZ2nxbS2jaRVVul26B1IIWYrp1UDJnoMDfToiE8DB6f7Ru0XuZdlDvUfI
	qmyIoHdn1WpjbECp4HFRlQTpu6qPZzQvZjUspEg55oIbpQE6bCjagm+1/STBLkjL
	MwDHhiS552nWzqet2sREks0dEbIHSqN96XgBjLfoSQfLsuta94wTN5rXAE6Zyz9d
	YloTWHdLEz5J0KSBPpFxtjs95IM09Snf95YNf9grOlz0Qheo5v399rIP/qQXFXpa
	gCSILi3XOSXEmgV/uhNLO8rBshCJc6mr2HBxa1hKRN0k3Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rh953r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:29:09 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3869865a304so3452484eec.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795516149; x=1796120949; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=isq1BtOcwaV6k1B+5U1NnLpldAIjmTJ+TO6ciHLOLmM=;
        b=hNjrsOkrhyg8w6IsDeNIS4R2yEAEn0IfJDnenSIHrM4MxqZ/y8mRnvqpMx7Co2bMr+
         rjm57sGk0W2Nd3FDGHM5fMnLMi12PtZx6iWww7R3OEj+uV0QcVhTCKmTr+9YT6DBzvEg
         /AzEpEU6M2fSp8I7wx5HKnIbYDJQ2n2flN7pvM47+8mVvVYQQoG7muxxaauW3KEF+uKV
         ca7X43dQN972Aa81jinX//IQnhbKT/VltLv6If4QP5DpUnDVxaEeVNV3RHKDMXhSfI2n
         M+7MsKI5yEj+xcHX6Q2oZtHUpp/wOoaPjndFTkCU4xabPU4XAgAw5eY0cTGbOvjkbQRj
         wxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516149; x=1796120949;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=isq1BtOcwaV6k1B+5U1NnLpldAIjmTJ+TO6ciHLOLmM=;
        b=FlQpeZd98+Iu+NL4SnzKnVrk7YxEVMFcuIzwc/qA3kR7AiMaTZPrwK5Ut/0/fU8TMS
         cRwTcCcDhX2KcC9BAC8EVM7ofR2WFh00kwzawepWhAywYK0e+R2MentLMCdibyLWNP2z
         jB3lveZrYZwk1941lZi/EQmchg5E4qVftxNGFCwr5VM2/kW+8Yo1YzptOSOZNTJMdCmQ
         gov/QR0/97GPWBthkiQIOPKxkTEOfPSXI22GyOSV8zsJu8gi7gJOPhxBTH1N+5jJCG8h
         2ulgBkJqROrq+gDN3owBM36kjBdtJjWo9h/i/qXTWOb2i4a6onfOVcd3p1YLQlT9Gass
         2zkg==
X-Forwarded-Encrypted: i=1; AL+hErH1w4oAAuK4ZoUKqCokGwhUcJnbuRzEACJmh2ZvJ310f1g6xu2pvrnSbUMHaQ+gH6WnWz3M1K+2uupt@vger.kernel.org
X-Gm-Message-State: APuU4Z+PgOP9mDz/lu8qO3i6s1j7WduYlzva0fkWknaOWw1v5/A+H1P1
	ianBAQ6fZeO0Mgij53WobGSKSEUbzEPysmldn9mpiVnvMJXCsUAzfegEPTKzr0rxkHbqhywXttA
	3b/FAVwRf4HMVxEN+/AlE3mZM/Cv8ZE6lne6q2a4OyqY2eHhaOazICTIi8Lc92NVF
X-Gm-Gg: AZFdTZeQLkQVxjSKXlMue1LlI0GDgGn8MVdvcU2gNBGbIdvUGEbQ2U7yXA8UZBqFQcL
	cyVMxiPjk8NhJmfEL43Xzz2Kv7OI2G/hNf62hh8/mSf1IPvqzJhRFXSVyXVoz3L8oCVWJ8bISrF
	JAMhv0j3pojrWTx283NEoHsp6dozH1QBrVjpcHePEjO6MA2c7YxPzHgzlAdZJkXlWec+5GxlLJL
	u44x5MzXEkQyv0S0SOW0Vi3hvx0EIZWXBfNwpg555uSD5ULK7gfJdYyS19HeQ6f3ZgrWvo7I3dy
	vboBV2GcTVxZQ2eqJdsaa/QMp9QpSj7zUsT0lVnyzRLJCZYjQfXw8OhxnjSGDGp0ZUUtQq4w5ry
	s1VsYDfQ30dv0+wTsEwTstOF+JWyW0dZSYQ6RgkNIPYbbTO1S0KMD7AFIwlhCjfMOKskF/gPsqS
	nL
X-Received: by 2002:a05:7301:c005:b0:386:a0c0:5e59 with SMTP id 5a478bee46e88-386a0c0757fmr11227802eec.20.1795516149081;
        Tue, 24 Nov 2026 02:29:09 -0800 (PST)
X-Received: by 2002:a05:7301:c005:b0:386:a0c0:5e59 with SMTP id 5a478bee46e88-386a0c0757fmr11227771eec.20.1795516148444;
        Tue, 24 Nov 2026 02:29:08 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm46045074eec.6.2026.11.24.02.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:29:07 -0800 (PST)
Date: Tue, 24 Nov 2026 15:58:59 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v7 4/5] arm64: dts: qcom: shikra: Add EL2 overlay for EVK
 variants
Message-ID: <20261124102859.s6wr5l2ta3sne7ci@hu-mojha-hyd.qualcomm.com>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
 <20261120-shikra-el2-v7-4-9d9000eb50d4@oss.qualcomm.com>
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
In-Reply-To: <20261120-shikra-el2-v7-4-9d9000eb50d4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b0566f5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=wRyLKtKWvOkyam-9G8YA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfX95d9ULUhdp5a
 iF15wpITeX8bAsLIyDp+RpuWFwAiEvWJooIOoW8YFeRRHJJiSNH4nFyTKyUZLQMuSniJtVk/7S2
 iyMTVPvpMUeg/40Z6wi/U27o4qyLSWw=
X-Proofpoint-GUID: RrNaV6aC4bvfQLC7XmlShLn7n0oqZIDD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfX+yD49yNn7whQ
 TX3/Dl2trn3H0ED6in/DWSZZKOnSlulsr6TDX4mg23u9CNv/6kTuvn7Zex11Ep5fmf3V1KZsd5G
 Hh81Q6yR8cnw6sWvFoxbLxzNM1rsSNx0x3Fy/sbqcjP+JdHCo1lRcAxRgswRQdpE8aOTwhTwXLT
 LzA7W41780LQo3aZj+5MgM1Yl0ftNjeT/CTi47CflLCKWqaj5+0fDSDpJt3cXQCc+UP2kpBswen
 ozstftjZFOvyOVLijHDKRyAIueU+0WJ8+tDXUVV1tHbr8973CSCe58Jd2v231aXm4Q3wQU8Owrf
 QYcSyFLLIB9f9X9dTqYvFsog0LSITry400BFFFpgmQpozj2MS0JWOeeuySuK1qWMFaYOm/7eT9y
 aMK1PhiBQ3AR0GBXRu5WeY0ZELYA7dZ2lZi2yEZ9/w0ot08tdOPBjEE534SvcaUx0ZXniWTdt/7
 yNnptSfKbSTV5MOtutQ==
X-Proofpoint-ORIG-GUID: RrNaV6aC4bvfQLC7XmlShLn7n0oqZIDD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240040

On Fri, Nov 20, 2026 at 06:50:52PM +0530, Komal Bajaj wrote:
> All existing Shikra board variants boot Linux under the Gunyah
> hypervisor, with Linux running at EL1. Linux can also be booted
> directly at EL2 on these devices.
> 
> For EL2 boot, describe the IOMMU streams used by the remote
> processor firmware in the DeviceTree consumed by Linux. Also
> disable GPU zap shader and Iris video codec.
> 
> Add an EL2-specific DT overlay and apply it to the Shikra CQM, CQS and
> IQS EVK variants to produce -el2.dtb artifacts alongside the standard
> DTBs.
> 
> Co-developed-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
