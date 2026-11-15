Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794725410;
	b=la1w3JbRdpi0ITA7pjEqvLMrVa5hhRgTbmnTA8eIl7FkmxHGgN2MVoWZ5xmN2LegBEav
	 mr2YWhrgO7VR7cAa5BDDzcCWUMImhTPJQfjh0F0GxIIkXbJYbICD9LVbAbU6xxJsw/k7D
	 6uvycacwH6e2G1kQsjYfhyqdg5ynAepJNhT5IiE2OfkqJKLDDbmEaxxR1nzEBQtJ24SdT
	 974Cnto0OifzztEkaU7XPQgIEx7f5wFAHOw2m4iJJIxretj1l7dH7tOndsT4ND2emrlcC
	 SVDFmzi8GaE0x3zSiBNaTu/DuA9Ct40ODWd8oheQvw+FGIpSMrN8eQTFP2ZySeVBYGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794725410;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3R67sizKxdGIAtBE34WIZvdULNtMn96MLTYZQZLf4TU=;
	b=oFJMX88EuAMNW9iKs+DKzROSrYLVhm2T/6ruKoFxklG4gvg/CiHgqLd3SwC1/zo7nd2T
	 6adlGVtc9H0Tf+a+RetfTOk1xmaDkV4BsPpiWYmK2cCriOG1b6ikeQ933YD2yKV9hwFHe
	 zUoVfukqqj8OZEn7Tz3WP0CYhnEHM1PWl1vWln8N5QiHZ9bQLbRIWqR4l6HufLdPmmGxi
	 YYw2STq9mkXWw5PoXBdWSplKz31Y5e2OqesI11NUBk5HSjJeZ65cavVg52y45GkaC74+U
	 N7TGjBszrzlH6QoB8rxVe34aIsbxTL6UGETMrt+DhctNB7ue1z9GWUqPHQMgRvNfUaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e46aqNi+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZVCeNmEt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A58606A330
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 06:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99A58606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e46aqNi+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZVCeNmEt
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF4S3tq1447387
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 06:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3R67sizKxdGIAtBE34WIZvdULNtMn96MLTYZQZLf4TU=; b=e46aqNi+2m8qj2TI
	mP7W+9TWSufJ2gq2nnkmdklX5kA9OZkNI3GY5GPUO4UXJnLUtlexFO2s2qkxQPP5
	k3qyYg5J4hltqx4HN8r7lBGCfN2O9+2aSn6FCgzH84yCNZJ1N4CPpior9hNbSAlb
	IeTxVfDak6qnudDPm//6fAyos1oXzQUrJdeajC+wOVO8XNmVTpEX/2dJ1LEbQDRI
	ulEgpQ2y801Cplcy5BonEjQnHRKDNeTYuCQEuKtLfSPKWr5EeSQkJ8wok82EVCpM
	YR7o2p0ufoBQ9JRa7JYAnh4Qq3FQ0pI2chlh/15qWMEO9Ez4qjw0yWj2BJvkJzUH
	ZuFMDw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx2jqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 06:50:08 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so3789756eec.1
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 22:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794725407; x=1795330207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3R67sizKxdGIAtBE34WIZvdULNtMn96MLTYZQZLf4TU=;
        b=ZVCeNmEt2quO6iOfqAJWXx62gfQTsa99PE5+B42FYFhZ+6IbnBq9swMhRfvQ9rYY+y
         jA83j1lUnSeIDmMLeW0tMftN/fba4Cb6kQ0g1bv1TTy01sBKiS9ByUC6MD6aU9VO9A82
         6AOkGCydVydaItfqqX6anmEISezd+2I7l3PtImVrCKJxFQJOUiHf+cJCI5lvmW8RgmA1
         Eyv/UhKZ6e44Uen6T+HxUO/LwqT2KRAvVtfEDAuvaHtgbXuiSqQUfyIsb9gVLI3N2omW
         3LbCiUMZaHbqWNLvvmLnZ8s9OhUWzGUlZO2URSY6m56NQVS/bdYRJ5Q4jeCQi7b9+sKb
         3Gbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794725407; x=1795330207;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3R67sizKxdGIAtBE34WIZvdULNtMn96MLTYZQZLf4TU=;
        b=BY/OxrWJHhyZcU9KT3XXosvYc1L3xFdgEisGHm2FyRda02wFwVuYLPeWhQkZuza+tU
         O9WpOgYkA63VuWNZXas7jnzKQIuRLbc0muTlCoUDClgc/Pjpiow/E+x/cAla/SSVBZoh
         mGMupI+zywym32diEd7zNd/vKlxVw0KBhB+s4USLUZzirGOaGk7Xs/mbcWqNCjJPOSCd
         7cXOXS6hVSG8p874MRogpbt5jh2LQjTJyrVCA3qH2RDQIg212EFW/nwEtDngdaICDgtI
         3L48Q/bDHJe406oRJF1NFSur3sPQGa1bRqxEbh6Zr03ZSmpQLCO1MAgg2Vlu85w/p6S4
         DdIA==
X-Forwarded-Encrypted: i=1; AL+hErG/qbSK4cz9qebwsmQ1u93cL1b8cbUm5S6Fzu1De+eRiCdZ9F+yKE5/RyTYr+N7JmXOKCXzcGjT+iyV@vger.kernel.org
X-Gm-Message-State: APuU4Z86euYtrIwpVCKJJJEXVRbEdfcDavY91obWHYe+MhmoRHeHM59m
	92FvczwoDK29EXguImbUWakVojfdXcnWYxhzCDBvFfYJC7IL8JpfCOEXthy+I/it+sEuTs9VKVb
	ubUw8k4ucJtl8jVWLdAH+X8jogd/pusd3h+t6PTrhkQ7M9psEt501h7XbtmThGiAq
X-Gm-Gg: AYBFou32EWBRo9qFdlJTGsiZwEnof/fCSGvK0XNFwh7J1/yg7Jv94Y/zCWR8ak3DwAH
	JlbqiGVrtVMV7X4aQWEhAS8KX4MVu+B6t3FmgjcA0DyySQ7BA3YWj3wDvLpHTUgFpASMo8UBV8R
	zlhgTnqYXbZwkMNRFghwod8tfHF+R2nJ7nYlunf59NBYyjPc2mjBYm5SiV4Wi2fGp//PFqNPQiG
	Qj0xAKWcmyeQlQ0j+vSFT7iqoaB+de75pIqRuGq8NGaDZkNDfwjCw0rnAKJT/TkZwRm/we9DRK1
	S/mkVaPR2FK0eFFJI6o04sMnqhgnOIY0drjn+MA9/X0KWvPk4cM6HEXAXFFec2WaeVmore/qgfL
	CrqjQMHyf8z/47e8QdQtuEbHu1D8kNpTfuAF51Lx+NJzPF8VzwXvxthe63iBZO0Q49WWmVrePai
	CR
X-Received: by 2002:a05:7301:1285:b0:375:dc5b:4400 with SMTP id 5a478bee46e88-379633723abmr10149295eec.1.1794725407163;
        Sat, 14 Nov 2026 22:50:07 -0800 (PST)
X-Received: by 2002:a05:7301:1285:b0:375:dc5b:4400 with SMTP id 5a478bee46e88-379633723abmr10149264eec.1.1794725406608;
        Sat, 14 Nov 2026 22:50:06 -0800 (PST)
Received: from [192.168.1.14] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379558231eesm21907314eec.12.2026.11.14.22.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 22:50:06 -0800 (PST)
Message-ID: <a348ca35-eb03-423e-80f9-4a61a25439c9@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 12:19:58 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,glymur-camss: Drop port@3
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
 <20261113-glymur_camss-v2-1-b1b76509c744@oss.qualcomm.com>
 <CAFEp6-2Twta_X4nyQVBa72zj1uaeGiK=F4j2edZFJrXA3rmtFQ@mail.gmail.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <CAFEp6-2Twta_X4nyQVBa72zj1uaeGiK=F4j2edZFJrXA3rmtFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDAyNiBTYWx0ZWRfX5583rAK3lF1e
 AC2saAgyQprTBwvGAaWpvnZwp5aDlL1aCflPqscO9MpnkdFW+00yGB+p5YbRJKzfEXbY4Q+MDgw
 IPK30RX8Il6HT4j3ygnE0c7KEwLubgM9YQg5l8ZZKCTepI0Ze2G1tP6HFCIgjdmP2rPELnu5dL/
 VIRhwYpts8CUVVyBE9+WMgh8Ki+bbB7oWljX+++iwQ/YGmhpD1ejL1x5ow2HO3yy0IXEsPmY8e2
 da4v3MSBoXV/m2SgbaSSkbb0okYfGjK8S3G461fdMv7ghpkMU+EW4R7pV9waw/jFFr9e9hkTDCI
 SsnEzCWoEarIsS7fV3UNjTn+pzqIhfHcuJWnnHMfIlPuS3c6JIrIuiHnaClZHKWY0pduYnvzE4G
 ENoM+c2ByqySNhUMD56uU6fy+qB+IeLHK8k1esxX7Z9ZjM0mpm1Oc70fTnMK7SlcTS3O56/j63T
 4+5Sbn5tHVb/qD9PIRw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDAyNiBTYWx0ZWRfX5cdg0HrEKpPB
 2iPuw1hEzpiP86jQN1gr7ra9qt/fj46PRr8i2zumi0Q9HtmzCkFSjlohef0GZwFUVPw3clltc0p
 hS4LWJrVXC5n+OefPFAOlnz5H+dM0BQ=
X-Proofpoint-ORIG-GUID: A5ji5XyhT462oq07qDIP0A0_xNLpuIbj
X-Proofpoint-GUID: A5ji5XyhT462oq07qDIP0A0_xNLpuIbj
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6af95620 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=9TA2UkIA_kddnzGnNAoA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150026



On 13-11-2026 15:24, Loic Poulain wrote:
>> Limit the allowed ports to port@0 through port@2 and update the example
>> to use port@2 for the third CSI2 PHY connection.
> I know you put this in the cover letter but you should probably
> explain here why you think it's ok to break the backward
> compatibility.
> Even if the binding is recent and we don't have in-tree users yet, you
> may encounter pushback on this.

Sure, I will update the commit message as below next ver:

Glymur has only three CSI2 PHYs, so there is no port@3 in the CAMSS
binding. There are no in-tree users of the old port@3 example yet.

Limit the allowed ports to port@0 through port@2 and update the example
to use port@2 for the third CSI2 PHY connection.

-- 
Regards,
Nihal Kumar Gupta

