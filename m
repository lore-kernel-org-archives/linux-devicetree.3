Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E8737A822
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 19:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791572976; cv=none; b=EfG96fTbtSdW6VQLMyhK83vwWEvApJX87qoxILlt6MY7jrMtCm751Vo8Wom9NCrnKIT2xQ5fVxqiVvL/sTlDEiyAsY9AbqKmijuNBoI6snHbMRjRUejfZOgOHqyVb8XNJxcAM/tY9CIPb/dybZ3loAEjfrjOcT6sYVjV4vEVAXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791572976; c=relaxed/simple;
	bh=enq4qEPadXLBj3ZEPOJuLUnc8Wm+dGgNBPwI0Y+P42g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHPmtQBKX/91BMMwI23QWzHdS2vNAhdup7itfl0MXqL6urVss3X13w7iqXQPPYAv1DgxL+jJRIymCbP/1H2tzW5pX+e/LDJXy5YM/7qnBD/lCOV/JBZ/CWe0Hmu9yy3orKlGppRAkqEXjZOFGrsXdKqPVuCcLBJQ32gVQrqO0tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bK3kjLUH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ibdr3lAL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bK3kjLUH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ibdr3lAL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699HZZQ02460063
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 19:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6RnvA+SzXeNiiPl6kbPgmaqN
	40rW8M++VLsuhxvpSuk=; b=bK3kjLUHOjAYMA64rylS13ZyomDlvdvhEncWYxZ+
	ZI4vYibVjFjiWx5Kvb5NEaC0GKtJT4UpldZlapoHSuLnKEziL/owKZCQkxbp9ZKr
	Y3P5tihtC8m0UCOlMZn0CprNhzTnTmRatsETNc9PGJa0SgF3+XtddUTy0PTMBWf6
	kktLxFjLzFXTGAnpQZmtH0LeofwlhIvPN6C0GD0vfK7oPAKbVi8fuhLc8aRxeEvT
	sZVsHNvAZ1+M52/C5CTqhdh9/CKbwyxC5O6PRkNWC3SW5inyg4XQv+yKi9lKy+VF
	qNK9xozcpWQ9bjG9+fyBUru+PVLI2IaT+Rh9Cb4Hesm5Dg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t88bbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 19:09:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93bf4c0af4eso483404285a.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 12:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791572973; x=1792177773; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6RnvA+SzXeNiiPl6kbPgmaqN40rW8M++VLsuhxvpSuk=;
        b=ibdr3lAL5DEPQiALLodb2nIoF75S2KMnVuq5WmhF4vpC6KnzKMeZrbssAqZdjADVsQ
         SnMe6PT0idm8QA7qIKMR7bKGljfJ/bgqRRgUAk1OeGqdp4SsI0E6SfEKRQdMQJjK7Tsr
         U5c+xjPlFA7H0Jf5PkwjaPXV6wKQ2acW6ZDxMRvxrJdJyZVylFSV4B9B7vfEgxheVotv
         YLjATZt6D/B+KD+rGfvhp2mVe3URyr2UOtFG5vI0JsgYV7/VKBdlD13UM4aiVck4F0k6
         jkVHKAAWQQ5UQjAX7pvnEBRIWBx6w+tgUxIKTMnurWB2eTjN5F+07vNkIRkflReT+qKg
         Z1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791572973; x=1792177773;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6RnvA+SzXeNiiPl6kbPgmaqN40rW8M++VLsuhxvpSuk=;
        b=hK1p6SaPZFHcGXJJE3piUXL2QWbOFe3XAivhQdOUMsxGTVpgHFI89qafxTdEhbz3Fd
         52Oa5J0XjXr5Lk9Y9/TgYpIHhxyLOPVpcReqbc8MxFjjv2CNK3tKdCt9THVumTcyIyCJ
         oOZ8YI6HASqYmtktVIaUAF31SUfdsSbrCr9+mow5r9Xtcbcym8rHfd/lgMFHrPIzrsv0
         pX1DVxqZRCTYZRmCM9B6zc/4cMVZm/kMLOAWCdPkmRNt1AnfNSg7SXcPCDeEOwZF+TOP
         tVWehJhwSQTufzxSFir0xleMmAzYI2cB1ea3ms/QI93/azJ409qXpjtnYTLei/A0+evd
         4DcA==
X-Forwarded-Encrypted: i=1; AKwUvByJ+2r6WekKU1LOYMMJkvTlmg9P9FyfFMNYoAsVFSScWDOi0+Ny/Cuw2AK8/A6o8zKxUnmhEtH0e51n@vger.kernel.org
X-Gm-Message-State: AFuF++lAXkE94CGxETYH3BteQBRJUt3wMJiqmjdLNFxUU/uuKyKKWx9r
	4/nMXtRxAJlOGLA+U0nmmhcDXQVL7alvXpxqh9k6/lpp5FsxfPsSvK2oUUCVH19MalaWyJ3Ak05
	JASJoQClXBbo424qtr+6QJ8oYuKVQNRiagvGYmiqgzQZPqDVZZ0HegaeFRcZOsYHT
X-Gm-Gg: AYBFou3eBlI2FXUoUwsh/Pt/H5Y6+uh1FvH4skX2bRaFk1BZSoawTi1N2yFTs/T48Lm
	sPhEjuxCnTEuA0D4888SmbmliFb70FZYg4UEfsYIXRvrv+kcrxvb5SsZpLxvz4tC2CK23KQOUiY
	6h56ESoW3lpvpK7uBCmMJSyvD5b2Bc35UIz85lwANegB6jiURYE3zgQcezjA4NieHyvh/U/i8Jz
	libfLfqz13fXTA72wDxOR/gPk8IFEcIEXU5Fr/1ShWppxHRJf35OThcVgfaWOXzn355GySHYBre
	lyQJFEcRMWETmOijL4KjK+skCXhoaT1s8g93k6RTlmeJL0+1o2m65UXTfRfNfbp0BPDJoTbmxDH
	JaWnDT2H7h063DHI=
X-Received: by 2002:a05:620a:2715:b0:93e:5677:317b with SMTP id af79cd13be357-93eb96549cbmr498462785a.25.1791572973211;
        Fri, 09 Oct 2026 12:09:33 -0700 (PDT)
X-Received: by 2002:a05:620a:2715:b0:93e:5677:317b with SMTP id af79cd13be357-93eb96549cbmr498458985a.25.1791572972648;
        Fri, 09 Oct 2026 12:09:32 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2e0dbsm78770315e9.11.2026.10.09.12.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 12:09:31 -0700 (PDT)
Date: Fri, 9 Oct 2026 22:09:30 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: juerg.haefliger@canonical.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1-hp-omnibook-x14: Consolidate
 pmics and chassis
Message-ID: <sie22supg25mtwcsekvu7sry4z4uuxmftupekpypltc3lewpsi@n7eal23pgkss>
References: <20261008-dts-qcom-hp-omnibook-x14-cleanup-v1-0-9702f7c6f9a0@canonical.com>
 <20261008-dts-qcom-hp-omnibook-x14-cleanup-v1-1-9702f7c6f9a0@canonical.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-dts-qcom-hp-omnibook-x14-cleanup-v1-1-9702f7c6f9a0@canonical.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3NiBTYWx0ZWRfXwozQ8FJlvI/O
 WgS4ESrQNNkvnrZ/Pz0kAxrgN1nL6ZECK9ThY2ARK50JVDrESfY2wcYyAV0U4+6+I87NkR+vu7j
 Av7zimxUAQNThAQp9g2JnV3LTcEWT8Q=
X-Proofpoint-ORIG-GUID: oI_EsAcmpeDs4IGSCi1dgNvfZfMsUBrM
X-Authority-Analysis: v=2.4 cv=D9jSufRj c=1 sm=1 tr=0 ts=6ac93bed cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=DfNHnWVPAAAA:8 a=EUspDBNiAAAA:8 a=tb8V0W7vhrSWw5vyytIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=rjTVMONInIDnV1a_A2c_:22
X-Proofpoint-GUID: oI_EsAcmpeDs4IGSCi1dgNvfZfMsUBrM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3NiBTYWx0ZWRfX/UIMtshFzYxH
 fRvRoMdavPE9raWKh9bDyAZFa2pKv06B2++k1cyWjJgpcSYwaGJ0iwdSptQvn3A0kZWeh2UeHDa
 rWkZe9CF/gFwG/EYiIQOg8ywaT1ZkG6KUjDOtTlAs6koxG7qRlNCgtQdztFQT/o1k4A9v/AmT2B
 PLJ79menqWrL4RmqeTM4NjwEghqqj+6ByJuIa17KNkGSNVyj/DGhc5drhWvGfUqLsu7KJGUwDUf
 qojnRKb3d0qPBlYYpl4s7GLo656fJqcSYEmXHXFUJtHStMlEYA1tlf7FXhZQG4mVJmBrBYgya8+
 O2snDrB77xmpwqNVRFNit7cz5NT8SbNmVJRd4rCuVvrR6mfbZVuOuMX/AHgR4K4b8+GlJYlxa90
 4N+2NOj+FOTQGgd/47HKx8W1ymIAxt6pqw/bPQkn/n9nRjTMO1PtC3O+zEdoi961ovKHTu7UY8w
 AP+LMr1pSlguzVMUCmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610090076

On 26-10-08 20:34:45, Juerg Haefliger via B4 Relay wrote:
> From: Juerg Haefliger <juerg.haefliger@canonical.com>
> 
> hamoa-pmics.dtsi and chassis-type are identical across the HP Omnibook X14
> boards that include this shared dtsi, so move them there.
> 
> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
