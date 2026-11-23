Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462609;
	b=5q36GqRcZD+JS+wD9XcicBwNJnHSypi1lsOh4fFOvc2xsx1WI0S2kxsRVm3Cb/x5rFff
	 BGPgzz104LfwohECtbCToMr5XEMpt7RQuFWRwxiwZSkOPBoUGIArION5X8gNQQGiGesNN
	 nY3L3e35A5sR20RYCmfQgJeaV0ZdAJnvQSTZuQcih0XyRB5hVHCjtHh3Qncg8Sv2QAUJT
	 shbkByC0L+jATuUsJfZDjsy9GegQAk3Jl7g+pGnhFyzNcrGwwZ3R2ifAAtoeT9C17RI+5
	 NmBHKUEMqeGafrSRwmt+gRGG2Y7CsuYEJ1CzN8SoOguk6O08fKB6tY9kWX5O2m0cqkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462609;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6aU+cchuetqDtzjD9jSrzXmm5L9uzDfuqw5ewOyVopE=;
	b=OoomJhrFuGR/lrg2hhtgRnvSisj+7CnvcCwTzIh9DlyMEjojNN5e/gdcwfLeqB4ySXdr
	 lzqL6ZiQD+iwGUHVm8e8xFp4jypuHY3MmQkUjrtkeGr0F9cVzNcPYvj0fsZSKYeSW4aU5
	 B4XLVEWXpiGItrIR3HEL0CIr5mH/sS3fknqARCHe01JMwXEkXeTqeA0YRJj+Jw8ZOH1GY
	 qtIS9t7rcJjT0K9WohnoRJwipFC7Enx0bfJEHPekmjFgBe0Omz0/m8dWk6mIvvZM7/8uH
	 eIaT3LiXT3fD+MgtIrsLVk7RHR7oq6dRLPggk3uVVWMnu/gs2vR4UqGquRDiN3YAGgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iVxyptQy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bKAti34M;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5452606A31F
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5452606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iVxyptQy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bKAti34M
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJNDGl647005
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6aU+cchuetqDtzjD9jSrzXmm
	5L9uzDfuqw5ewOyVopE=; b=iVxyptQyjbLdiD3MOBcuca1LHEDdlI/vq7mQDPNn
	L6TB/voo6VsCPcz55NyJQ2q4PbOshmC2Rzxl5Iahos3fItygEA+NnHwNcPP3w33T
	uWgi1qjKEPmolYVbfpX+3zntRn9lIsfl2hWnVmCWRUm5cV/q7TKAZL9zTuDAJs2j
	l/Vw8B8fzaKZNoUIkZk9ZvIwFl7eBD7cUQB2npHEWqwasg5QcPsm2Mz9XbhXOuV0
	QUhdTmByTU5OVQ1sQ3oO8qNmuIYcPKqGLQ44u/rKh5aVjloFkDsV2YfAH+d3CqdM
	UKs3aJBrTnJOzE9A2qSFxkhY7GpGQdwqlGkPsQc9UZWUxA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqg1h6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:36:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2c0e6653so572252185a.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462607; x=1796067407; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6aU+cchuetqDtzjD9jSrzXmm5L9uzDfuqw5ewOyVopE=;
        b=bKAti34Mh7WNLgI2C9TuC+tqXFyihBwGWkk/rJotugXxvSJxfNzciunb4KOALivbmG
         BKDhp5fTyznyglrUoo2fYidmonWKVPnFX3zX/kU9ELWe81fzr22g7XAsiGq+og13RcsT
         zGNvvcDMhpvuMltMz2fI/l3UDLNldg6EAaStM4zfIsAUPAtFhLm1cde0UsraXojq9xyi
         jfZRnaoIITipuOxd/EMIKCn8dC7Sv8EmuFbTWHT7cWMHdpkc9f/zyX5tyHNXeJ5y7dYC
         H4Pl+rvtQTD9xYqfgOlMpc9IKMCoMb7k7lOsrOrDe/zcE6RAOnMPJCEwUpNES4xlsKaN
         wlng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462607; x=1796067407;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6aU+cchuetqDtzjD9jSrzXmm5L9uzDfuqw5ewOyVopE=;
        b=uJAeq7c1kge7aypwoM+j1nDnYO3RTSut5A5wgyGRK2/d7xAzRVZVRySCS7Lv2S9csJ
         XeR+Jo2HRHSGpaUz3rg0DTjs5MBpy0cJtdEZBB5o1miiDkfCTNuuHpyLewGfLuFLFuDT
         qg/kkFnsT95J+nlCkByXBWW3CH9v0soExhWsTfcKQqX+oKetyt8EZkS9UYPRUJ4HvohO
         UE9vQa0gjCfgkOtoT8swVXk9fMf5XoInBab9eKJYAe4+wsd3bIcz3m1Btm/3CSwxBy7+
         dOZGDXH7dxlG239ho2wbYeH3EHg4DsMH7cAdmtSKSyMzGCHsq/yXndy2eoLgK5i6n+3+
         nytQ==
X-Forwarded-Encrypted: i=1; AL+hErH9CB0gOylOZqhFUrMwt7+t2f8npZF4BFt8wYn+pbjg5Vdtxid7HwWCT+e5eaTAO77sZDc+bxXML+x/@vger.kernel.org
X-Gm-Message-State: APuU4Z8nRwrBvkWoyY5uFPsZx5xifJSRJgBS/fl0DdXRqf2+X/ghOGOw
	bATykmXKI1FpGyvOIf9N79W4w/KPbOK8CsMoiQz9GrgOaX7Ikx9L87NITYuzg/nM9eV4qdOblr9
	s7Yj/s1MXp16Z4wDrKFogyp0QZVcWfcNqIua+rAhD2xyRUTBoX4P7uEwue48vNQ9Q
X-Gm-Gg: AZFdTZdA7NC79vRLpURHc2wCUDqGBnoE0BmSbqrSd4wwn7di7R8POPavDMqsGpIJ7ub
	AXsk+cRs8fUjTyey+ml4vKsWp3FuGeXDqVCErOA1J+R/YtDzfjuqR2BzYwJXs6H9a9ARWDq4kmc
	k5f8LU2M7qnLOj0v+XpQ3pur7nRfQpACz4zGoTQdJpAGU//RRE0i/9r+8MU3ogk1bq9lEmXHkv0
	lKJqkZ3QFdldUzpz9/foEqXdBhYGhS/RSy2v7fWNqCZbgo+L/rawJonU+ha57VczgYmElTbZj/S
	EWiZGXBsCalbFNpDZLSUh/fhKBAv1aKg8y+2EFyTCm4lnw8lDqfzr8Tkk39S+ZmCCQA2zKFVV6n
	kKfVDpfv4SRu6p7GwGHsiiLZoGBndboVZSkeUDXwBN0A9IZQ1xL5BtR03UuQ4GTNB
X-Received: by 2002:a05:620a:c51:b0:949:7641:3872 with SMTP id af79cd13be357-949ba9b8b16mr2280104585a.14.1795462606882;
        Mon, 23 Nov 2026 11:36:46 -0800 (PST)
X-Received: by 2002:a05:620a:c51:b0:949:7641:3872 with SMTP id af79cd13be357-949ba9b8b16mr2280096985a.14.1795462606303;
        Mon, 23 Nov 2026 11:36:46 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm336356205e9.12.2026.11.23.11.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:36:45 -0800 (PST)
Date: Mon, 23 Nov 2026 21:36:44 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 24/24] arm64: dts: qcom: x1e78100-t14s: add WSA
 speaker protection VI feedback
Message-ID: <j4zssaws6gb4cico53bwweb3755agxwrunxao3ykvbpa4rbzi3@j3lkijgta4as>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261122161437.5994-25-srinivas.kandagatla@oss.qualcomm.com>
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
In-Reply-To: <20261122161437.5994-25-srinivas.kandagatla@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b0495cf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=M6omgQR0Woip3EZOlBYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXyk4CCEDpP9ER
 V/hQQ7qQakalszm5USSev7ZptV5x8l7LeXDgt4yiYbb09RAWX+MNRlU+tTEOFtjgdGkHM9QJfOQ
 mcinwcwc3ssVHEgbvPkynLSiaWym12Ywop0UV+3+zJpSEHKdd6x9YJ5diZAiZeiL30BLPkM/s1T
 KHvhHNyjiyOlt+fPEExfo0ebKzkUquqhsJydMLNYz6aPYEyvxj614qjMOIwmwZOnJTjC8R6rxea
 Vbey2l3oMjKzaIqDaYQ21hiGHdIx6Cupo8YHshMev7lvPBv1lhP9jOMqoQ/TKd9br3Y1dIxi9DA
 Bpwe/AD6P4RV38OLkChfJwMZKpAPabfT6fY+67aFX6y3aiN9AMoZk9IVv9/FY84q5N3CziGTWVE
 YSgRjwg7LOaegslHvIXs3gUau9BfxschNEBjHUE6DPWGuppxFAFa1YomQkErwLGfusnZ2sV8xz+
 znBPThN7OCn9UJKEM7g==
X-Proofpoint-GUID: Dpt-sSrL2-qI9zMWZFY8Ou_WLDj7Q5AS
X-Proofpoint-ORIG-GUID: Dpt-sSrL2-qI9zMWZFY8Ou_WLDj7Q5AS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX+oexgDv6J1Q1
 +S8Wiiv+2/9box9Dk7Gar2Pv4Y75Bhsb55sqpLB3aegXAURTYMp0UxtErY982hJ1HO9jYR+62uX
 VcHqqENMfItzNoQ0gSs+8LucLAY9qF8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-22 16:14:37, Srinivas Kandagatla wrote:
> Add the V/I sense DAIs of the two WSA8845 speakers, the SoundWire VI
> ports and the WSA macro VI capture DAI to the WSA Playback link, for
> speaker protection. The speakers now expose two DAIs, so give them a
> '#sound-dai-cells' of 1 and address the playback DAI explicitly.
> 
> The VI sense master ports (10 and 11) are picked up from the VISENSE
> slot of the per-speaker qcom,port-mapping, which differs from the
> mahua-t14s Gen 7 layout (12/13).
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
