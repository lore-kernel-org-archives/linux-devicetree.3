Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795451500;
	b=DPq0Eyor6mioaIzftnZVGfYjxX9vJQWUCijdmLchN/HLnYTErcntGhDMDYu47zKPrCuG
	 u07tS1JS2/0rlogknHBKfLrxfHs4hhpRP3Ul72hS2I7yRqwjKXbDuhiPasNypvIndWzOP
	 oDlUVp9XFhfkTNoC2sY0zbI+/I5SVjkbH6nWdB1g5sy7Q1f3dn2H/trs4SOGSuMaa9jz5
	 KBsDp4HmxDfNgFj7QxOS58d7XKzrVrz0ZOwgBPEy1LRP5ZBlTFkdvN29TCEX6e6/avHYy
	 7zIeVnqg+uH04rqEWFE0v0WvF5uGTP9oukZY27z+oWKEMBoTG5JKcLPAzzt9EKiWfWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451500;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7NOwNcsngTEaHkJEW3GErrX3AAbJGPw+NpkX8JQVxf8=;
	b=ip1eYrw/9ZoPFLTtfPWvsi/FZZ24z4Sj3gdzyYN33ZOHsxQN98/qfeKKO7WObHoMAeL7
	 wJOD1h3/7e277gkL6LX4XUCRA++9JvxpHBQzjlw2/clp7A/R3FtFBIdlzi4u29PjuWMme
	 E/oREWWcGseRa0H81/yFhoZNpcDr9uNYjywnEGNvMoouUJXgBi000jooFOC/Z2UG1dLcl
	 JhjVdMWD0jRu1XZm3jSleC9Vj6dvprYG3DBeEfpZQczC3wZdYObCwbpx8IOi/4PAF6Uet
	 6ohzP/A0MSsBKbhnqPH/n8U9/3fJG91rBmxSd3G0Y4ht43KMJLIQHbbO7RlveJhrkBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QcKmy7MB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Eyqj0/3F";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29471606A336
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29471606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QcKmy7MB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Eyqj0/3F
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGn7T3025350
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7NOwNcsngTEaHkJEW3GErrX3
	AAbJGPw+NpkX8JQVxf8=; b=QcKmy7MBb97K0QSzDrScF+1C6T/GrGJV835J+s91
	C3aEIhawydLZuwr+h4N6LczdTRoWzQz+uvMIzBc4v0L6FwFutC4oYF6ByQBxJ6++
	ueIbk2J2rens3k5vfWYP+lpbm2HrnFRkiqROorhLEvZyhnZHY9e/g1prrWfEESvi
	cMjR0e5miMOSPx1mk2CczH0PKj7kqkR0MFOomk+4VsGf0ff8s6tpkn0d2qn9r9jA
	E6uMUEqEPbKwHhiKoqaiZIB3pjuEXks9yNzrw+ashRqA07qZ1gX6F6mRyowGcLmR
	SgotwrH6LARog6V3X9CoGa8pWa/YEgdQl6mcKxXmkAW+aw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pacr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:31:39 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3869accaac2so1833429eec.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 08:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795451499; x=1796056299; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7NOwNcsngTEaHkJEW3GErrX3AAbJGPw+NpkX8JQVxf8=;
        b=Eyqj0/3FvIPMyrBKTVmQg2Hga2RoWIkPrfMJDxJ/Rj4fdLvrQQm7OLtNV4+eDTYU2i
         mP5s6izCvtG5YkqEGqv54saYqJS4a8syZp7aeVrV58X26Nf+L4b8Kd+b0G6MgWY64OhK
         phaZVhJ/PW5wt2F++4MTQkLZ7r+w3e8dwk70qCwJjijO6Yw6pQg9CKSa8GH5kUPTitjD
         yAeGDbVR0Pk/ZWkKsK2jEu0/Qw5DRoTDzitUM0VUqhwsI0QNA4vAxRCqhNUgTXSFR9n6
         YYBXe6imDVkKZeyb7wVZNtHU9HS06aZ7yo8kqKJCurSxlWgStBVukjP86JOvVsWyZFdn
         qrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795451499; x=1796056299;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7NOwNcsngTEaHkJEW3GErrX3AAbJGPw+NpkX8JQVxf8=;
        b=cZYCDH+TnjNHlH912DGLPAniuylNtspi0KUWvQm3eMmES3dR6moQRgeIDnKIBbAl5T
         Z9xoiqTjsCzR+s6p9+ObqX/CDEx07FIU1UT9umnQ9dn9b7n3TF0885H/Q9Dl8pFas9Js
         hXciU9MGODPxdKqgeTvfJpvVnGD+JcLiU0QrVL5FLcKX1mzF26axEgTuyiGkhJxWRRM6
         cVIuT6ojGpEIUMz053dApK9Y/N6rmtxublq7PcSE3SSATzEVvhCpjzVQZY3x8WmSFbpN
         rhzpjx1g//+43nGRcL9JfJa/Xhe+cONJPYYYvClHkuumjrK03qNxWk3f1GMHUnohrLon
         2hMQ==
X-Forwarded-Encrypted: i=1; AL+hErGuETgx44ArIGZUJ0ivNL8mMVrL9VofG/qXg5sJ2eP75aZ1CYwluH2Qx+SUJxAVBh3MdctGixvGBvgw@vger.kernel.org
X-Gm-Message-State: APuU4Z86CeUvDYr6W/MXFY8RHN7w4nyl/aqG1OQu8glPxr6SG7Axnd4q
	ed4yPdnijpGaUuSHxz19maR7lzHtdAGyy+mYV+6RxtvfUqSP18WVwREVSiCPvPvnlY1gDsQtSQ2
	Y9TxMOIaGWCCtQbHUbt3lKZEUAoDGfDeAZ7cIUpbWWqhlUr/2haatntuwi4vjaZzA
X-Gm-Gg: AZFdTZeum7OkxH4/6F0IT+VEn9HWR1bRrUBTaPzF0teEL+iMBAfN1r9hNiqjsMQgxEo
	RR3kmQLr/tdAcf1ADgbsQaj1/XmwsDdiZ5ujisi2qfEYyT70j8ZGXZCGJKxq8N97C1lN5IRtl1N
	p4j3Js0Lmp2rvXKj4AeocgfAvz4YVAMqy0LSTyyqRC+kDIbc826TAU9NwnhYMtceZVt10aITVjK
	ZUcFJUbqwkYj8SMonFMflHRFtTpjIfY9xV0wz/3+s8LP4XN2bNNmoVXPxEcSW9HzJ1hVoh8/Q6s
	QunHPhflrPP41XDgxbzFGTyraB0gZ4TRe6EupTBRMR+S5xtHsUSV/2WV9+VD5sKWoLzWk372wCx
	f/xWX0kr+HeG59oKSTbx7tL5kcTG2WjAkvTzWZOYuv9Rwi/EEtzOMK3I8KehkT9MSV+1EoMS2eG
	BR
X-Received: by 2002:a05:7301:4283:b0:386:96fb:28c with SMTP id 5a478bee46e88-38696fb2022mr10557998eec.18.1795451498528;
        Mon, 23 Nov 2026 08:31:38 -0800 (PST)
X-Received: by 2002:a05:7301:4283:b0:386:96fb:28c with SMTP id 5a478bee46e88-38696fb2022mr10557970eec.18.1795451497840;
        Mon, 23 Nov 2026 08:31:37 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm38685149eec.12.2026.11.23.08.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:31:37 -0800 (PST)
Date: Mon, 23 Nov 2026 22:01:29 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: agatti: Mark RPM message RAM as
 no-memory-wc
Message-ID: <20261123163129.64fqkb5jniwitmwi@hu-mojha-hyd.qualcomm.com>
References: <20261123-rpm-memory-non-wc-v2-0-3e868b4bfa48@oss.qualcomm.com>
 <20261123-rpm-memory-non-wc-v2-2-3e868b4bfa48@oss.qualcomm.com>
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
In-Reply-To: <20261123-rpm-memory-non-wc-v2-2-3e868b4bfa48@oss.qualcomm.com>
X-Proofpoint-GUID: rZPmWh1PCuTTmtMDevU503asfOCq4DK_
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b046a6b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=wLgbqfl3iQV84jYfjRYA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NSBTYWx0ZWRfX+aWuNzzRgIHR
 suz3mYOSNamxzMkiN5/qLt+nuPEzuCOUK4KLjP/t2xS9p4qv1cBBCLi7+RYSGX72CT0WmOdanYK
 lOSiALpeSizxkfMo1nozDe+QN2a797k=
X-Proofpoint-ORIG-GUID: rZPmWh1PCuTTmtMDevU503asfOCq4DK_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NSBTYWx0ZWRfXzZFCFA89txTu
 0umvgNCtpy1eXE/I2ASawJo1wLqj+t9UkdeLYvM1+j/0294ahbV0KD/f0HacynrG3YBPaKsZiE3
 DfgjSSCqAMOjT5I7X2Il0azwVsk20xioIUPG3lejnvMD5hLT6pEuNOPAJriwXnTetxpf7FT2RgN
 +JrzEg75lQ7XmgE0dP74MVwueqQGfJfAFWWpLrdBvl7K9MvEjk+1yktL8tfNInpt5QYouNw2AKu
 SDS/AlIuxAdANPEnhtmdeL8o8TsRSpMbnY6gU8q9s3NWkKvPVlpgR5RBMqy6FxmqCjqUhzJWnM1
 D8Fi7/Uz5Fyxslwt413ewqghqK67YbcaLgLVtqu97zlFgwDdusBlMSmyIWsVoSp/C5hzsCZ07Hf
 EPHGoqoPYwYEt2GINg+duyP6742jZMbBvhZsf4uyZ6JJ95ls98xAIp3NMeEdJa1bNHRl5tQWM/C
 LmdR44Il83Iz0Vb0Djg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230065

On Mon, Nov 23, 2026 at 11:48:57AM +0530, Vishnu Santhosh wrote:
> The RPM message RAM is shared with other subsystems, and parts of it
> are not accessible to the APSS. It is expected to be mapped as Device
> memory.
> 
> The "mmio-sram" compatible makes the SRAM driver map the region as
> write-combined (Normal Non-cacheable) memory instead, which allows
> speculative reads into the protected parts.
> 
> When Linux runs at EL2 (KVM with VHE), there is no stage-2 translation
> and the write-combined mapping takes effect, so such reads can result
> in XPU violations. When Linux runs at EL1 under a hypervisor such as
> Gunyah, a Device mapping of the region at stage-2 hides the issue, as
> the stricter memory type applies.
> 
> Add no-memory-wc so the region is mapped as Device memory.
> 
> Fixes: e3f6a6994041 ("arm64: dts: qcom: qcm2290: Hook up MPM")
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
