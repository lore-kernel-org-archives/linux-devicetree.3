Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578951;
	b=cmbOJC9u0yP+ctWo8ZdF0GM4YkQSxrW2QbT33ZbOklz1/5Rhp1WfNgjVUdDQMoD0e0JM
	 aZqC6qirLf/cqky04AO3eS34Ajxn0QoYzPvkl9lBBJaz0BEarl0VIjvI0kA10AAu9sRA3
	 ZhbFxWTniORrXKOcZISRrJv9sfoHYJr+q7O9fdaYk6zZWoTpvIjIdo1rWaGAlc6NWxDF2
	 ieLwpOKwi+t6kh1W4iRhYJS012Elc2uXEjsNqzGe7d3KsTBPfj2MXmndjvGPesOhRKiD2
	 LwrYDJsXLJNMGcxL3blcyX8DzV3b3DoIBPbnARWkG1fWfXHBj1UcsIFwLQN70MpYikw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578951;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DVoFS5UdeUKhEoUyshqUvMPNFzcB9a4hiumD1nyvvGo=;
	b=mFhhcYHNUoPwY9bCNwscz9Ld/TY3mDhtNgtxGXFoOILXM7K6gAlZvqP2JpVYsE7yI8Ks
	 Py2I+8cPIlpO9xcJyDJNKcAhdM2D1OObpNrTTmfxaKlxi51MNrmZnRsQQ4TZASNmeIl6n
	 Zhge3x1DVb1ZvWFHLbzEX4WT0UNYoQNyIlBR/DtFxmNPSqGkzRsCQTU1Hs/X6CBgV/x7i
	 ZrFDJCneIk//cVxWxz56jS4awhxmtjEy/REIkoTmx5TmHvJtLpPdk8UrSq6csHkDT8Uyi
	 i4phqhZ2pFp77ZLkEDOHxHl1aJcUVBr5S7/oOnqnM1swRrhVFZ4NdF8geVRxn2ylhPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kj1lw3qc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QHNJF500;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1338606A32D
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1338606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kj1lw3qc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QHNJF500
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5ji83449631
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DVoFS5UdeUKhEoUyshqUvMPNFzcB9a4hiumD1nyvvGo=; b=kj1lw3qcgVzh9yrJ
	g5cjz2WfGS0Mir4lkZ9p+r87Yd43Dsu6W5akW4KQwJu6YU+nkuAXn4z4hvdU/Iab
	3yHn1kXxaNt9Z4r5W5DfEtXpCQBAS86GEn7OO28q31v2KJDEKU//GWOKQM1179UW
	gpgbQdpQeSTmCnYTUK7yg17g4qzFpGnn6Q/Hp/UgEYNkb6T2Du6woWrKxEnfOSLW
	G7zyfNRFgu+WXetuKpXZnSvNbdza3+JXwuJr2JAOi806Z32cKEwUujkUWryipSan
	ftEzhBEyeSVcosL8BFYE/1+dSV35IkYCnXrHIJ4+cw3RBWReni4knJVjOd0Le6VZ
	70wL3g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb9ba6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:35:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93edac5877bso18079085a.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 03:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792578949; x=1793183749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DVoFS5UdeUKhEoUyshqUvMPNFzcB9a4hiumD1nyvvGo=;
        b=QHNJF500GXzcexmKby7RzJq1l1wR8z4kNf1rextZyMGPKmacLPaH/VLrtq89/Fw/Ca
         efJz56j0rDwlyKEa4HU3VvMqhJgX2GsBcr2VYdVeNfz1as0QfHj6FN2u/LBQdQy8S8YB
         tesAsZfF95gx7+Q7PiiYLrgF9rz+ThM862HAfR8SoSY95tsyUxPJeFtE/tl/cdxgb2im
         gMR7MM3Z3metfv1TOfUrURfc2S0JzdmeFHmnl+YHJjV8Aa55Op4AsSOySUsvvxFeCH2g
         XWv/RRPW9nGFVEGkiI4g4I6+V0y2fvwAbVNw+3kZkJ84p3dWrS83xdt230bzRPpSnNfh
         JEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578949; x=1793183749;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DVoFS5UdeUKhEoUyshqUvMPNFzcB9a4hiumD1nyvvGo=;
        b=rC2zAsIMyyF+j6oyLc8nSRS9Tnf/no9wR1H/DqQNz6GT206W1sV7gDiQNzptCoCwmr
         t98rvMSPxmygQeGlRSoXnvpPZGXdzlxqhOMQjGuEoreBXAlnPstBpvkMLwGLIp1krW4B
         CKUOsjBtceTuf6DKB0cpuMcyd5K78qeoYXLXHJ1Ga409Mqi0tKB9vjwN3acC4BI8LEOb
         t2uyuuiC1B5hSRqsSqcp8ooP9OjHSP/Ei8S5G1L8TX7W7bwFC93U6Ppdj/9Hoync+iPZ
         K+pMYU3ZXmkuFDfUlU/u9gbBi3HgsklpVAlBh9qYRyv7K+k83q2SgfnTkc0I04/tBKvY
         v55Q==
X-Forwarded-Encrypted: i=1; AKwUvBx1Uy8v8hDrV/ekzlY8rsaCOITxLGKtta6tGN1Id9ZFOHs9XW7p6HkKff68ZkI4O8TRWJi8Ux0pKkTq@vger.kernel.org
X-Gm-Message-State: AFq9FYL8r1Ofw2+WOkSU+PEtuo8BFlIK0meum7dAAjuJKJDot+ZQQNoc
	rwI8Tq70EBQ9LRDlVPXTvP3BMfvhFnAszZAINdxfsxKMFUllTKS4OCSFfatVCuOIaElNeGOq8uR
	eRW6nAEs/sIn9XH/FQTcsDSrqlu0Cr0JQW91HlbgdAHO7giiqhMsoobzQqr9zW5dD
X-Gm-Gg: AYBFou02l31BwckJ8hzUsx5EBlnFjuACF1tIippRN4g1+YAnOoRLy6Fc9ylFHnQbI6U
	EMGGp8YMyY0R3JjSs1Ztirk0kJ9m+Mx9wMI2sF1NRNUnD1mioVsdHe3k+XzA3jWVs/57uUI9IyS
	vjUfsF3fe5B8TgOd6QxjZdrNefSCu67OaxPmxpQYrtFA+6awl8gXia99h7Bsk8pHxGaobW57pl3
	fqTGhzOEO3+U1qL6BF04JoQ/rbh/Yp/vmTCPcJm0ECerU+gthzRcB7A/NH6ofWPI7nYpdk06Tah
	PucH8ODahS7uPKSgLgJF9uFRGnd2oK1yfw+RctP/5Ao6xLdiOmX+tGI0MRFwo5H4RxW+/9MJiEr
	KFuZ1pSgoYkyPHa9zNADySA==
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr439495885a.6.1792578948909;
        Wed, 21 Oct 2026 03:35:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr439491185a.6.1792578948428;
        Wed, 21 Oct 2026 03:35:48 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40315a59esm695162a12.32.2026.10.21.03.35.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:35:47 -0700 (PDT)
Message-ID: <193e4885-9d0d-4f33-b2b1-650021413bec@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:35:43 +0200
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
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: msm8917: Use a shallower cluster
 state to fix unresponsive idle
To: Reza Kurniawan <imkyufie@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Val Packett <val@packett.cool>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261018-psci-fix-v2-0-35f65b59eb9a@gmail.com>
 <20261018-psci-fix-v2-4-35f65b59eb9a@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261018-psci-fix-v2-4-35f65b59eb9a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX+Zu/9y4q9cVS
 HCXtEBHoh9zsNPOYXVOpmLdyid01IzexFSywNYtr/W002uMT7V1+eS+n15t7sCelkTLOmGgyO4L
 KpRB3p/ua7YKft88tA3BINgY1c7wliY=
X-Proofpoint-GUID: i7KPmRVZSaozhNK6IM1mUMAcsNvlBuvv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX1uiWpP7b9FeZ
 3FBDZJoB7hEBLzKUHTaFK/ViPlnQTLQWNstrzDQ1RY2b+QdsvM0278nLxy7ZCbmjhaY1oUHwH/a
 2nCAvOOoy6yhvIsTxSMWNb7uVHoIV0GQ7NzUqIKOY3E/asq75zIp40AfDzQ1Abhikb8D/BHXyG2
 hn8ul5M3voLbpr17LGM/vgutblKuGTVOy+85goTScXLhDP+dGUppmqLK7BhYLpWpkJKFI0Vl266
 QBT4XVhiXE0WU8lovPu9CAQtLdCYXEChZF6Jr5XyVW1SyOAHSxTnLIRLyH0Qd3T4HA4ic4uEEOe
 dY7RnxTxAyojEnfRogsFJKxoRQ1moymiQhRlCGl3X22+NZj4RB8TUTxYBgd2+dyZ9c5S5P5MxNu
 6/KnIaTsKWG2mEuAZk+kWsf7E6l/H9kGFqyplGN9m+/1Gv3d7+mK56353xfBb/4MyGvuavBLF96
 r4JxLfLLyWKnpI5Mpig==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad89585 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=VTptWAqQFsUFMNnqaZMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: i7KPmRVZSaozhNK6IM1mUMAcsNvlBuvv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210042

On 10/18/26 6:29 AM, Reza Kurniawan wrote:
> MSM8917 is a single cluster SoC, so powering down the cluster means
> powering down the whole system. This causes two problems:
> 
> 1. The system becomes unresponsive, even to common interrupts. Waking it
>    requires an interrupt from the MPM (MSM Power Manager) or scheduling
>    the MPM to wake the system later. Linux currently has no way of doing
>    the latter, so the cluster may never resume operation.
> 
> 2. Entering power collapse blanks the screen. When the state is entered
>    and exited repeatedly, this shows up as visible flicker.
> 
> Even if MPM scheduling were implemented, the second problem would remain
> and it wouldn't fix the system being unresponsive at idle.
> 
> Replace the idle state with PSCI mode 4 (dubbed GDHS downstream), which
> is less aggressive and can wake up from conventional interrupt sources.
> 
> Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> ---

For the sake of git bisect working, please order this patch before
patch 3.

Or alternatively, we can get rid of this one if the MPM rework
series lands first.

Konrad
