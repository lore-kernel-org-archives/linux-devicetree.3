Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487080;
	b=UGjyFMouP5NLPtKKbQgwmZjdnxtpSP4iYUdtU6UYMfZlsxD8eeixKjWTDqbFE56Q9ik5
	 lhbpYCX/OYiipSdirAAUtpOhucdoaQyVDH/w4QQW/lA8941kSDOO3a9SJZYANiBRPr4pB
	 bPhv5HC20HeteTXVYkhP6nxjNs4Y1btF6IGUaiN55qxcGGI6Of+vw129cpNr4KR+optkg
	 CBF6079s1gB+//PC/8sKYQqovl3ncpJcPuPAsn18FhEBKsg7oWx3/WxPh0ik/adptJJHp
	 Iv8cnRS+LSCtt1ae3eSR28IJOPmOX2TMB2VvroNZ11hyWI+q40omQTQ2N1B5JPqo9Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487080;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2LGSwVG6leAos56EnJfcUfJ3UVLzAsF77/obd9U1Vhw=;
	b=Y6ZzyIlOKiBGQ0dGMJqzCppAb5MsZkQ+XLaBfwqCGb2YOvJv8yGa2FtWFmuc56k5/HMn
	 wCg7yCJgDKrMHB7rKO1yPycK8jBDpaxtWJtVVG0I+63QzxyswBJ45XPOsq2O3zaVxvxDY
	 WKrXmN3oxQ5O8DRo2a0YJVxnJ2nOw03oRUtwN1MdiCHVJc2ZcFwmcYTfTmL6wZnkJrtii
	 LadhblQ6qexu/kkRh2fFAQj6e2zG+XD2zNBKGyK/2HJZoguQs2PgcTSDgKBCmVANvOX3B
	 cwmGHyQZuWO19P9jlrQgRaDw4i1FJTx4ZPH8OYSzf4Nc3at7gd3Xa1ed0S7W87HrO8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ckOi/o0Q";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R30kpvdQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDAA606A321
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 12:38:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EDAA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ckOi/o0Q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R30kpvdQ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7oe2T2819033
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 12:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2LGSwVG6leA
	os56EnJfcUfJ3UVLzAsF77/obd9U1Vhw=; b=ckOi/o0QcnZRHH99pJLvX1OL8aK
	d98Z8iCmRnBJ19fb9L4yy/spJsZ8xgqitsFBbR+FSlaspGSGBUSvh3t5OiiyJMkB
	xTRU2ykWt9ofh/+ondi48YcxdrJnqayxsUU2S1EcvrGcaUEltMHRFi33lxs8vv4h
	8EmPh7S35wq1r05pAtlVhz3bb2ag98ACHvtiM5vzH6X6r1DkbyNOjKEzxXXWR/tx
	wSvpskvCew/FLxpYeAzuynJaQDRinXJD8HUXsdU/KFyek1BYq+4PhNSeujOUwfhl
	aVOCiCk7CnftIg0ZhKivEctkKVGcBkuLhPawp0tCO2pWXLvdx/tXQoEyxJQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e190s6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 12:37:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb7f9bb86so915821685a.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794487079; x=1795091879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2LGSwVG6leAos56EnJfcUfJ3UVLzAsF77/obd9U1Vhw=;
        b=R30kpvdQxEOZCmoZtCEK5dBQHuL7N0Oc1lmhUVb+6HADzDHrLt8llRN+laHqMM1xu6
         Jx7CbFTt8avclQkXNs6wJ2GdBd1JeF3fm9uXoBvyhHwOY/Lbso26pfyI5Ffr8U1G/NFh
         TuJ8ABjY0d33RjSaoaFb6d7XD4vWrmkuwpXhhz74CovojSZ2HTxTOqWEMkqDrbSz9pLP
         VIop/lEB7qcwFCSQiO29mW4m8dfDgOfkoFWOujCAJqYrRfIUMh+voKW4g08m7v+x5yx2
         DjflZB027HiGcOE3QEoL2fTwZr/OuUEtsDNMD/Vq0g+Phiw6HqqUNJk2GVdGypAbCcqU
         maZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794487079; x=1795091879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2LGSwVG6leAos56EnJfcUfJ3UVLzAsF77/obd9U1Vhw=;
        b=BqkeNvXsnmgXkl9/WSzK4YQUULTV0WdA+VjbAQf1+wKEI1M9ItZ6S1K0XEJ8OcWm24
         Lg0NWpXblvKpYWnipFM5Mxv6xYCxtYKSLm/Y2tRb1i72vjc0eG6k6eyp9GMPauJJcEsd
         7yV0VGXOIriB1EMVsU/2Q47LEbHokxR4a2zX06zZ3P/3Lk7/hZtKMgqBInK9kwCbpx82
         ElE+7CDrDiC+aA3RuwQp1CbLB4zPaN8jnyVr7TynmVJY0URsaUHsPIQKxrp9jN1Hv9Q/
         otohqVSMxGJJ1Ps2ZZYx4z63twY5FIKa5vzjIsH2ccoDrUUyZVTeTAgWTY2cKNN81VsC
         ILnQ==
X-Forwarded-Encrypted: i=1; AL+hErGawvWb4D+nI5o1ayyAOZd0GhPNgEoy/a2S++G95hsWIWHqY2WhW2A9FLPHthOPsZ5NVQuvKnywYI91@vger.kernel.org
X-Gm-Message-State: APuU4Z/jZ/ITKda5ILUTdkwsCbxZlI0YQ6thB4o9+5lojMQJ2ElVN9Vt
	JfMM377/cnMRuJvRaPjO5vXcEiOGvnULkT9MsmBAYoR2gIVhAJrEUk15/fQopRyEa1cFjoPCQtL
	uABRsYhI811OciFoEKzfF05zubGK4CFbQj64w9Dxb0/kOqpKyBcvoXAb2rIdyfJvu
X-Gm-Gg: AYBFou3gYsrDUZFGFDvkbXRO8fV6L0VzrSfprWncjB/rDhPsuJGPKPbNh2pJx9VVlmu
	lawt1ZlxbtqgUrnSO9m4t+PEcWHX36neS0vnSbYoeRTgePPz7vm03mOC0gmM63GirreuJllGBRv
	uzISXkozi3XUZqzKh2m1zrogg8MceWC5gEbUQ5Wc5VpIolwTu2EzROyLy0Zc8h/3alu6H38AAxM
	Hl3WZiwT+O4t4tyD4xcaHGA6si/raa3z5+e92R5HpDJMCaPDJEnBF2dKlskpX575nORMwf0l4+I
	fuBxjuRLPE70+KJBAUtuopHfOtxtUqeWaSEmtQEMq4slxMQbzxoL9IdumRC7pXfb55cjR7PekIe
	6lyBVEqzRi/vKEIGaQ4pfVP6UlBoDMS35PXccZId4++0q0Bi1Pkyguq4dvODAVU9vGy5Gei4MZQ
	==
X-Received: by 2002:a05:620a:470e:b0:93e:c12c:f128 with SMTP id af79cd13be357-947b00cd27bmr911343285a.67.1794487078582;
        Thu, 12 Nov 2026 04:37:58 -0800 (PST)
X-Received: by 2002:a05:620a:470e:b0:93e:c12c:f128 with SMTP id af79cd13be357-947b00cd27bmr911339185a.67.1794487078095;
        Thu, 12 Nov 2026 04:37:58 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7b23bc254sm218990a12.30.2026.11.12.04.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:37:57 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: Re: [PATCH v8 1/8] dt-bindings: media: qcom: Add JPEG encoder binding
Date: Thu, 12 Nov 2026 14:37:55 +0200
Message-Id: <20261112123755.711756-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAFEp6-1dryYHtVme6M7opGHUen3vC+DyLJM8J1WKqVp6zwMWWQ@mail.gmail.com>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com> <20261110163909.78085-2-atanas.filipov@oss.qualcomm.com> <CAFEp6-1dryYHtVme6M7opGHUen3vC+DyLJM8J1WKqVp6zwMWWQ@mail.gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MCBTYWx0ZWRfX6QoPGfLFbrhO
 jMzidB8YSGHw75kSmxA0Jptur/6HiJG3pEi4FElR4ob6MioP4iJfod8tCDUetv3fdCSH5/5kjD0
 Lkhdc36LmjjJRo0zSuEvXM4JqokgX/YX5XcZkY8tbyRf7sAyVu5sawyHmjGNu61rqcWjLmXM+jl
 oAsYdGk6frRJ458qAjxEhPYpbgd0uG8iOBKrkHlNvObSroG4N0Jsi96DSWL8qHKU+oyYO+aB0at
 EsVyAjF2lodY8P3hjF5gdVhlF7ugS/DBpTJSMQBSBBVdCYZxxCxmObfdLWu+un1LlzO2MQrwQkm
 OTH63TJ/nJ9dX7WMGb9NFoS/Cr8n8+UG6/Y/slhKMQ5HUDdx2bS10IUiTe8fa6l34kifFvxDYAg
 BticDgR/mbySfBg6o9mEOX/oB6QI2PRS8lFmO+FBF81/9WwsNHyRFqYLd5CYuXLqv7kv38SpfEr
 RtZ7eXnYn/Oog+TpShQ==
X-Proofpoint-GUID: RuiYzVOFSiT2AaXJIC4R91TU2WHGAFhX
X-Proofpoint-ORIG-GUID: RuiYzVOFSiT2AaXJIC4R91TU2WHGAFhX
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af5b327 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=FGaIqgoJOpKkMoVgYFUA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MCBTYWx0ZWRfX0zQuNLejRWFA
 6OxmQwS3h6K01XFGbx8JxaTxHQUuRIyIhTAXhpZ1xzl0kt3VtuzYn59y/GA9MApp2r8GUgQsBVF
 Z7EcUg78ycm2GH+K82RsnMMmW6jYieo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120050

On Thu, Nov 12, 2026 at 09:41:27AM +0100, Loic Poulain wrote:
> I find the clock names a bit inconsistent. For example, camnoc_axi
> explicitly refers to an AXI clock, whereas bus is much more generic
> and does not follow the same naming convention.
>
> I don't have a strong preference, but perhaps 'bus' could be renamed
> to 'data' or 'nrt_data' (SF path is associated with non-real-time
> resources).
>
> Similarly, for camnoc_axi, maybe something like 'camnoc' or 'camnoc_data'.

Ok. In the next version the names are core, data, config, cpas and
camnoc. This follows the core/config/data scheme from the v6
discussion.

--
Best regards,
Atanas
