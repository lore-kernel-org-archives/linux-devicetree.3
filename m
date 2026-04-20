Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4501539E182
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 12:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776689856; cv=none; b=Z6oRf9DUxDpS3IqR0IRx1ARPg70WZVnvOHXD42dUtEkBLTQqPOjGekFQGVtaoUJgLn0gWlRQ/NRAP7YrTJGPy1GslbmGL8vblwwLCmiRpV3VKVOWSiBbSeFC6KD5akSC+V7C77bsEu8AvYj2hGkZ8SYAiAes/BcIDes/Ccv1tNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776689856; c=relaxed/simple;
	bh=2yuzhsqIoFkC93c8bQUG7uE36plzmoFPEtctfPNZbxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PPA3rrTb9QCqdyIp3eaqNPy/HIWa/xQz2+R+iQiBfTe8IN/d1UoFxgGdl0r+fQacj51xYAVAmPUwwZyoh9tE+8ULTSsBSKVa4K3DbO9ZbJ7xWSVajzJh0iGn2ek0mLpMmdmouaI8dTGxEp2WHXaAO412fg+InEmL+H6cz8R7MN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DOpVZm/x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ymy336hn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOpVZm/x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ymy336hn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K97qG81599885
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 12:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=41og4mU1cLDXbt7IUpYZOpMl
	mqtt4dfz8VnoGJQGa8U=; b=DOpVZm/xN/P2BBvah3VvNjMlOn5xsAXk5r9cx/RR
	jn/gCp6WiV2dtQpJ/Yf7wGvknOeNQMsM5o+hYsZqh/YbkJWoXgEhy8M8f8OEfW4D
	AwSpAWaSyrY3Y16RU41RgFqmPLNmWonnyaR833AZsykPu/xrFIjjU9UG4YKl84GX
	POSpm3vnRPrT6m6MUCPeWKBwfay/VXtkr6So7Z9LCs0LWFXZ2jIIdpgujkoNvu+M
	HAdBS0emtefdUg7WWDcqyqU8Z4w8JDEtar1FE2my+TpbeWakq/MxNtxQOZ/zlVOi
	YvPUwUu0PgnumtjcBiYV+ms3B4jGH4jh55GV/ToxoddiIw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh898rbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 12:57:32 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-127876be621so2677459c88.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 05:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776689851; x=1777294651; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=41og4mU1cLDXbt7IUpYZOpMlmqtt4dfz8VnoGJQGa8U=;
        b=Ymy336hneZq8kQqKCHEOgaaL+gDp5WbC0Y82vPyUE+ydgIUDpoX1BY19CDVjy+O3Q4
         Ws7jhbTeOwxEuFJdSYmUgPc5pu1R2UY0POb4bT3LUfVbGYtsCMkxpJjpV8HKf6um/WHL
         mEN+iBcYcIEuX02OudJIbtaYe3hsY/Oa5VzoI6wBWk/s4bxMNhdzsyByMmzM1hGYF5RV
         tHxLwHYLat0m1P3CSm5oVZUYiQ/uuWw9NBclB7wzfwBC1ztAoNPxKtzIFjhTn1Ln+5Rd
         1fipFQUeoDjRNOLwDEmhBXPGdfBs4+dk6UMkpr3kXj1eWi660zJgs0GLz/qP80ZNQYFt
         BITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776689851; x=1777294651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41og4mU1cLDXbt7IUpYZOpMlmqtt4dfz8VnoGJQGa8U=;
        b=RBgrKTGAOENS7V0cRO0BeXAEMgn2fRMP4Hm6zry0u03TX9a+7nAzgcF+BpmfrXoudl
         AEHogorGEj8/QlaDHY6qBZh+yenJE1mtGw3vrknbVzIxuX8mk8m2YLIVK+I/XEsaRfcH
         DPxe3WYZ5lk5NaceJq8rxGDMV+Z6i7NwjpOUd1Am4EdYHvvXCYEOmyuweX8LuLaglBoF
         FGsXNVZByGCrtUcNRR8OisQyyNaNfNMnPxCJ0UzK+k5dMS7Q5o/RnsNwbNNXMMW/AmYI
         pkWJ2R3ZEMMCqQDATrhr94B4QzARGkl52vvYsK27yFtmx65ElHdtMOFI+iSRr/ujh2YF
         SGHw==
X-Forwarded-Encrypted: i=1; AFNElJ8xCJ+uJNa+yycXHc+WQUiHlEXW3hiZbOx4fi6EncfdEVt1/8zEkYYUgtNT3Rd1WA6XFOTOgryYQwF4@vger.kernel.org
X-Gm-Message-State: AOJu0YycKPBuuTkI9Y9nke3Sc7diRlCkGY4D4AX3PktiFmmRJUXfsFze
	FKRop/xJW8P+nLZOX8vK9kv+mnw5dF3ZHIFurJuK5Nm1bo7J4Ti2+t8g7BL23mOZc7Ryf0J4dkH
	TO1tI4+lmVlEP+I4KOAeF1VuKIXqhXFaTLkv0GRExP9MfVILAoWZtTa95NUUuM56e
X-Gm-Gg: AeBDieu7vLIHn+j+6b0tvDoMqWZaKuBfOPY4f00Lkv3UHMcejQYcxKupyL5UrQ/OmzJ
	e9q4NlFCRLq1g2Oli508iWi8fbhXrQEDOhFhRMl8X6cE+4YVk8HtYmgmmDJlTLSQZ3M26JkX6/9
	FbLUwEot4RbNmsKX95eRMn5sEQa5Y73hHbCzHkxNOL/ycG3o858KLFrjEN1Np2N8+FE+jclJ4Vv
	glzssiKw+7fESK46zldb+sXJmAwiK0/cenfnsds6J3JznVKn1RcFeE9WC+3XIMk9iQf55M1Z//Q
	GORYg6l5eqBT0PdUpWE6sIzkmL64d2QQ7q/y6zz5MXN8fOggdfWM0BktFfIB2ND/Cu+XUhha/aV
	q55OjqM2FNuZwj5z4br6isP3QDgmxlKgTFIf73UYm+1LlXxP2UxNpQs9oUbPlyG7elnAfHZnTXF
	0=
X-Received: by 2002:a05:7022:1281:b0:11c:883d:1ef0 with SMTP id a92af1059eb24-12c73b2c248mr5226096c88.15.1776689851135;
        Mon, 20 Apr 2026 05:57:31 -0700 (PDT)
X-Received: by 2002:a05:7022:1281:b0:11c:883d:1ef0 with SMTP id a92af1059eb24-12c73b2c248mr5226067c88.15.1776689850578;
        Mon, 20 Apr 2026 05:57:30 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c7b62fe87sm10608117c88.2.2026.04.20.05.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 05:57:30 -0700 (PDT)
Date: Mon, 20 Apr 2026 20:57:23 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: crypto: qcom,inline-crypto-engine: Document
 Nord ICE
Message-ID: <aeYis8uC0BcGXB3Z@QCOM-aGQu4IUr3Y>
References: <20260420073301.1250197-1-shengchao.guo@oss.qualcomm.com>
 <dd5ee12e-1aac-494f-a8f8-74e236ecb47c@kernel.org>
 <aeXmOSfAFoxhIAcD@QCOM-aGQu4IUr3Y>
 <4b074757-ac44-4077-8ab4-5a983d1be50b@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b074757-ac44-4077-8ab4-5a983d1be50b@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEyNiBTYWx0ZWRfX5W2SKO9O6m4Z
 NrWPcoEpjUHeB5pTTvOd34Lj9gyinQ6w59jdddxfuz96y5mApu9e/Vh/0sj/lkcy+LKGmo96Tbr
 qgzlNgt4zolVnOfF4tFRpqvqg1gAYhFYvodMJoSrH0iAbmZTo0bk775mPI8pPESoFH12bzYucpo
 hGZ/eVV9P/CVboAv0nLEpLj8vsjqs9TZO3w/N/nP9uWIY2GgC7a3Ht7vzaja5Wwr6oJVgKUTrNP
 REW0yvihkuPoGQENePmCIGFq1d9y6bqS9ayjjbDPk2aecTjF7HgYUVUM8Gvq8tuKLXjRtrqr9ji
 jYJbZTU4weaByTX3ekFrsTyVvmW4yklg9PbFaV2UmSaU6L+4ZvnPB/bp9v/a+JoCXAUJx5p/r6P
 qZ+MYt7JUUWFpTWzHjJeomN5Rb2sp0rHXjNyxegPCHQRbts1d1zgJcfwMdLT7hkyYyG4XZ3RSpw
 hFcLP9xz09qmQSFWUuA==
X-Authority-Analysis: v=2.4 cv=D6B37PRj c=1 sm=1 tr=0 ts=69e622bc cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=NEAV23lmAAAA:8 a=lIS4hxcDbv2UqGGAmQAA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: zYKVesLSbun-2-4H-iaKD0ST72jMr41f
X-Proofpoint-GUID: zYKVesLSbun-2-4H-iaKD0ST72jMr41f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200126

On Mon, Apr 20, 2026 at 01:56:46PM +0200, Krzysztof Kozlowski wrote:
> On 20/04/2026 10:39, Shawn Guo wrote:
> > On Mon, Apr 20, 2026 at 10:27:56AM +0200, Krzysztof Kozlowski wrote:
> >> On 20/04/2026 09:33, Shawn Guo wrote:
> >>> Add compatible for Inline Crypto Engine (ICE) on Qualcomm Nord SoC
> >>> witha fallback on qcom,inline-crypto-engine.
> >>
> >> Don't explain what the diff is doing. Explain why. Why do you use fallback?
> >>
> >> What is Nord? It's nowhere explained. First posting was 1.5 months ago
> >> and it did not provide any explanation. I don't see any information
> >> being posted in the series sent now.
> > 
> > I'm still checking internally to see how we can get the best socinfo
> > patch describing Nord which is a SoC family covering both SA8997P and
> > IQ10 variant.  Hopefully I will get it soon.
> 
> I found the DTS on:
> https://github.com/qualcomm-linux/kernel-topics/commits/early/hwe/nord/
> so it should be mentioned somewhere, which I kind of asked when we
> discussed about adding compatibles used by that DTS. You would solve
> yourself all my questions from three threads.

Ah, I see.  I thought only patches posted to list count.

Thanks!

Shawn
