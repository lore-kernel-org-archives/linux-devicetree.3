Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516066;
	b=X6W7wLAy2rc8640Kou3JX9/Vtdq06jaTxl+R3B1z/3h9ZOMjDg+QPwMIvzOagCCbXJM4
	 TrHZld9oY53X+L0SdCCOiywBQg6Uh6M32RP+fn6F7iVb4Vh/NJT8Ul2iy2b4hfHFh74Ds
	 t1FhyDB02UsEaKE2YE5iPWN6DM5oyBGA/X60vIF9jwPzgv3/6oCFIpuIfl+ruye8MrM7n
	 IL4X7/YWh/4WZEeXw+cQe0MrQfdaGP4+n7R4nJezvc9BIZhBOrddpaTRRVbKL+cTLaCws
	 gYiSx6hoMjqLEBRRSkN5qBmtxR1p+Ic7v6yJsLqLrLSceM9i7qiuiEyMTOig32pjN2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516066;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vcl5YiUrbFKyKkOQnxaMI+T47Jq9o3luS62ccZg1YjY=;
	b=lfg8onhoyg535ciB8lVS9ZV6u9LppGTxM+ytstY7tDiSxgY/ZZhjN12H4D1xB+gLC2LU
	 cQgtSWTRmGUYfEVBYq0ZX2SR7ZxwFvcAqxbzTeZrZWHYTxDY4L5jOqlunaJX/UFzDtLtj
	 QbBf0sbueO6Hqo6Rj74EpS2J8Vqf4l70FuEx5Vlfk1mV1Akepua8V+RqcOy2dLQifTulX
	 pVnyjPX6NBZsx2R3K5kYTlI8LJRE7kvb615SxUCSHENATwJCfb4bn61ZSkiB5w4l/4rTy
	 rgD1ewgZhsTxMmY5dYEyJwBODwShpY3nAdl/dZkmG7a0JeaVYnucxgx8qazQ/T5NLUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OGCN7uqN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="AK4Qhj/d";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD33C606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:27:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD33C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OGCN7uqN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AK4Qhj/d
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8Z5gk3850977
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vcl5YiUrbFKyKkOQnxaMI+T4
	7Jq9o3luS62ccZg1YjY=; b=OGCN7uqN05tuOGacoC1593ZXu/H840KxnH4UJ6Zt
	NUsSLwJunItQqdz7vX1SttC39rEeMZ2dFc+S09B9W/R5PFaoTVFNJ6aT/rnSqSCl
	KIe/XrjD/ppEuI4rLTu/MTiL5Tpx7YhezQkkL8SVwHYxPVfCYW+bJsqGPzwn3kjK
	A7JsNx5M+b4AjFk88vjhdydgcDk0qLnocYhz6tyuMm4dGe9NDieu/IqmoocxkOyO
	fG8/e5HjHwuURIrzSjJa5+Fj7OZsQGPl9JKpueS5XG2WbLoqI2USbBF2xyYrSonr
	Fwv/PdZ7sq7+5oYSLa3tM/yOaTVdm2lp37Ha6g7CHe5tPQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvb27pr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:27:44 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b29df78132so3910828c88.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795516064; x=1796120864; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vcl5YiUrbFKyKkOQnxaMI+T47Jq9o3luS62ccZg1YjY=;
        b=AK4Qhj/dBvYGgezfeuuAmX9FgHkw3wYkmnJGSx/tgYXCm5g+z/dX2iXGu+Dka15vD8
         PlIQlPiINrgMpX6Bi1SdHHyXJWpG7Z2PpF8oFLY5+aJ3T9scN+e3D1U9gCnv9qrpOZz/
         m7lgtzHiBhxIEfgCYj5KwnA15CydxsQLQrmJasfoCJYsEkUX7xRuLf7wb3yCCDuiC5x2
         +LA3B9tQYHb8J4i1RqwuO3+slCNKMDuCIGaw1fBoYcd1Zgs7tHbR1Pb+kMb1hoZaUfIK
         9Lp+E4ktbFYcP+pWhHR8fZN7+/PPBrK8dxV4oJJG/o/xPmW4Cf+Q4lPQN8+1tLMNMbOX
         m69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516064; x=1796120864;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vcl5YiUrbFKyKkOQnxaMI+T47Jq9o3luS62ccZg1YjY=;
        b=Eg4IVhktaXuAsqLU4i1pKtqDZFYsyYzTL9SfqxWdYXzgeqV/bGu0w7jixlv9GjuFC/
         Romr3ZyJnBHRxYhVaenf3aZG+kcvpuZC7eAaNByffPdqtXObK/ZUFK7g5rB0paE/itJf
         lP8EB7DACb1Bi+Qo5WZDDBfPzEUYBTZVMArFfyakZZD1bBWcMdQXjT/SS7WN+ZzahiKG
         kVdxPn4Jh76RBNUkLVPQFTl9oxXEM3httBuj9IC5hhltuBZ6SSEBuOOJRjIO8hVKkRBD
         96XkN9LEZn2zwdNO0zK7GOAD6cJ9Wy1ZM3iVt8vZiX/ImfKYF74TCJqZ6X7fhyAHRgWj
         y3Sg==
X-Forwarded-Encrypted: i=1; AL+hErEXV289WcJ7Gha43N7dmXeHFQlrvMqkPxfyLXE69v5nT6gNLPjoBK4IS4rogin6Adcj2cbpQPZxiT9W@vger.kernel.org
X-Gm-Message-State: APuU4Z8QoVEsvTmaxIN0TcEpeC9rPyQIC57vzWZH0Bbm1jcWvduD9Es0
	kG6TrPOvQx9OTQIm9la1zuq5LucpzyEroKaNYM0KknzI7rNcC+2laLsFCBq7KZpOLCMe02rvqGM
	k4IhYM3VCZQNNKKpD7XKyiQEauSakCew32c1b/HhrPtbkewhmqDgWi9s/CZa8c7Jw
X-Gm-Gg: AZFdTZdjqbi1vbmhq5RtczDd5HIHRl7NX+pMzd70SIoNTmvTvwAK7Ok09hNIP+98r5P
	QSg85TOzuPJQqz98FvM7s77eFsj4WIBjRYfvnoeKxau/BdgCOJuoobqBoc4XHyfTsWkO59InWEt
	cf+LHG9FfJwwN8nxbLZzBEc8FylBC7dCY4PYl39Nb7SXHx2Ujqr5G3QuRs12tuX9iCy1TG/Zh+E
	9dxhSBx7n6tcuQco/AXiYCFEYTaN5DDvZ0YznPSNHCTkCKPX71KwFQ+UDsOuVTkhmjcCuvQqTWn
	CLsPe5GmTmiAOFs4pX51XpNkW8aMK7Jdz+nZwAlfo4OwJx8RVJ26bM6CaMECOVSS1e2gjZ4fj4c
	6nMjVZHfQPIGaUw+KryCeFGJG1YgMhZLbw6+Can48tuR7Eu3+WJ1oOb9PBR4DV2+wIfsFI9mfvW
	Ux
X-Received: by 2002:a05:701b:2514:b0:16a:c6f2:60c2 with SMTP id a92af1059eb24-1b55689fcb2mr12874039c88.12.1795516063683;
        Tue, 24 Nov 2026 02:27:43 -0800 (PST)
X-Received: by 2002:a05:701b:2514:b0:16a:c6f2:60c2 with SMTP id a92af1059eb24-1b55689fcb2mr12874001c88.12.1795516063089;
        Tue, 24 Nov 2026 02:27:43 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm49238690c88.14.2026.11.24.02.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:27:42 -0800 (PST)
Date: Tue, 24 Nov 2026 15:57:34 +0530
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
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v7 5/5] arm64: dts: qcom: sm8750: Add EL2 overlay for MTP
Message-ID: <20261124102734.7hf4s5nf5kpkw64y@hu-mojha-hyd.qualcomm.com>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
 <20261120-shikra-el2-v7-5-9d9000eb50d4@oss.qualcomm.com>
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
In-Reply-To: <20261120-shikra-el2-v7-5-9d9000eb50d4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6b0566a0 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=RR6Oj5ZeI5PBhayghEMA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: dqO-LoEIAAvtw5UmJIx5Fe3rftp3WXqr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfXzQeloUzA93y1
 5QMiatqpsfm6i3c6LEo6RFdsOmcZO4/NDC2vPGbR+RsyVOegJrA92xnMkqC0DWhYVs6QWjcOE6T
 gUPTzQ6eT06bRhoTsTe2OFQ/yPXtVqc=
X-Proofpoint-GUID: dqO-LoEIAAvtw5UmJIx5Fe3rftp3WXqr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfX66dpsKA8noxo
 +F+GE4NfZblx3KlAgUsqMiWZCugipzWxUGRE3EPHas8GzSBD7M9yQc8hQEWvm5OSb1Husaj8gyb
 TQUOJGMRXG27qvjxUQTg5ITDRsX8fglGUUZw2sJRt/s7q1+wbk7HgBHhbcq5SpdtODsgsxrLgY8
 BqWx6jh0Zi3XN+g/V41Y0OMTHTVwnKd7AZz7ib6ltv5vmKUkBgMo6OVtftFqSSL/A7zp06VpSF7
 ktYZNAKB62bYgc56DWcm8B4cAw+wUiS3i3hpMmxm9lPh/w/YowrXkB3N8ftfe494CVFGKXq0Shl
 I6oMJf12QC74aK466SjRAWEO7WtavTWJAnISytlTlzBpQ5c2Yjqy+zWiaTSWm1lRDtBYZ7+4GYd
 WhGHVev6UIsJi/o8xjmZYVuqduYhM6+mEkUvPcQYlmgPHE5OgUmbX/uIhQFJin441SJxyTbbSWZ
 k2H6vk80q379Ya/wWCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240040

On Fri, Nov 20, 2026 at 06:50:53PM +0530, Komal Bajaj wrote:
> SM8750 boards boot Linux under the Gunyah hypervisor, with Linux
> running at EL1. Linux can also be booted directly at EL2 on these
> devices.
> 
> For EL2 boot, describe the IOMMU streams used by the remote processor
> firmware in the DeviceTree consumed by Linux. Also disable GPU zap
> shader and Iris video codec.
> 
> Add an EL2-specific DT overlay and apply it to the SM8750 MTP to
> produce sm8750-mtp-el2.dtb alongside the standard DTB.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>


Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
