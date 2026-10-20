Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501378;
	b=BHn6Cd98f+6SuZEtKzCduxJ6Lm6uUpXW9vu/1DvQ2VP6dfJnYKYQ23W+YC5wJjtHsLGh
	 GtdgcqANZUGYMRaRnRivZIV14d4Ezs7JMTnwtG3noixTLp/k8/s21vXw2K4ZNSfeFAVcf
	 1/sZZLh9IpnyK6ejg2eeJyhMUAmUgpXgJrowcgHrQF/KdOLVyZbQy4kR0zTAgLZ0ppE5r
	 PBd7VDj83dcGUPGmUYrx+vm2eYQNf7lA1lS5SxPa5gToqpnDpmA24ANHpk1btefM+koOc
	 zjfchOizYohViN6n5bZ+7v5CiU0RXkaoBEdRscysogXbIJUHyvPC6/fbBpPwbdhhLTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501378;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=px4pRxwPG0kCk7ZExiNp1R8AgRsYjY9bdnbQlLC4dRw=;
	b=49ZcgRVpD/GrOg9/mixoHuTjWCOhKK2Mfvsb4X66QSLSpzrQncSJCK6LeQJFOakEC3q5
	 EGCZCMVn8gDaYHFJUt6JNEFCN8JXn0mlSnQywjhnQfPCIxi5z2FeSwsohWh0yWM33qibT
	 kf/nJ69RA/dXPPs5WJv0rtqYIywd1XzO2YiAML0H/hJMuB1jQCc6jhca5FkCUpGk6kLa9
	 6Gf3lx+KpGiMf0ga/gYRWb2GLgZNgIk5UHNWVqSmzHfTU+7vJ7FrhiNtTgp8H6hz5SFl2
	 h+m57mvJlpVFMkdmrOkvG3cjFD2p648PGO1GMlcYPemH5SzLfcwhcFADAfynLIR6uzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XrtP91GN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VfL7W+H6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3DE606A322
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D3DE606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XrtP91GN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VfL7W+H6
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KBZsNh1527297
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=px4pRxwPG0kCk7ZExiNp1R8A
	gRsYjY9bdnbQlLC4dRw=; b=XrtP91GN1YmA1JntTWsZNBgEH9FPP6raZCo7X4DF
	qiN25o8diN9ekcIMUCjA7esWlm1+AA/vVP1KSguAz4uyeWfIJQEVAL9fyxp9VUZg
	wfehte0qA+RYS0wzkSDWLuylZWsG8AmMK+SD4IfL9UPZeJBQwckWSlHaqEeTTFzS
	mZjzRUGJcXC12mq1ueTpuwdvmQUeo+t2fkfNP0eMUfQYoXZPcmH6FBJyc5MiknzW
	CA0sQPsaLAuuiBSMvEoXmM3CXxSKukDeAtaFfD62LVug/W+tUASeZHd0nyJNc+Wb
	ajDJXojgAFcTTSMxCaPqWe9hdpsV57xk/2fIi323lyB3vg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2j9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:02:57 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-990634bef80so166611241.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501377; x=1793106177; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=px4pRxwPG0kCk7ZExiNp1R8AgRsYjY9bdnbQlLC4dRw=;
        b=VfL7W+H6/39ZjUqtvmvLnG4f3PYJNs3YHcHJQ8CrcgpmCbadEKosqtB6QEKN3N1GSA
         IF8wheBOE5MmQGQDuHW8xzdF/MF0UTBLWchkmj9NvY+dGRBdKZGSeNzCdbdXvHnOleTk
         zZYhnkXzRtsv1RVmgWOXqRapg7Ri3nzdQGZLkQzyuaJamQoylOSdVsCoIyKqlNkssYbd
         Lu6skJQJNjMYc0vHWbXmEg6J9OocUmG11QmzR0wBsZwdCs1/qTqYX1uHZ+mHDmS6JO4B
         7jaVuxltNuOfNzO5qlN7LHHI62USx9Yg6kKzXX+hymsqP6PhMvkVD3oLSWlvvx9pZHdz
         yjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501377; x=1793106177;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=px4pRxwPG0kCk7ZExiNp1R8AgRsYjY9bdnbQlLC4dRw=;
        b=nx+XAJyaSEiO1o1i3u5RF4nRHngVLloQA5UFHN0lxeuxV8mYAiAV7jPH2ramNELC5A
         mIdwQQgg7X6QiWy3BYMdmapVnlXJepQnJGJoanHHQkqWQhMQq5fdRb7wPCAsohriYgBw
         ax4Wv40+cAWdJ8LsbAg96uSAkYMvuq5ktc8AIwFdH/n5wHPwzFIyYTQRrUN09Zj81sKt
         5Md8j2xVV6v6UZlGNZU2R0M3tCj3xaOehYqHR0EjxjzjaxibXi7/esv7jqKyrcyElDm/
         I3EpCE94zKvvo3rS/Xhwpp6fte3IA2ogGrZidudEOItF+NrWraIQSz2kX90mUvvbUxa3
         WyDA==
X-Forwarded-Encrypted: i=1; AKwUvBwqlvrxSAfcIJXR2fMi0oh+0Zt8uv/b0mStWsHbXTM0qzKKrnkHh5KG4WAFw7PCINWjPYDGBscbbWF5@vger.kernel.org
X-Gm-Message-State: AFq9FYIQsILzn5s73aYBiwSYJDSW6lkQMKUl+8BfjrH9GhtuONYVH80U
	imStc46zIY2yV6Hj4drF6N6dsnyngC5RrHKA0Wy37DwFwI8OiHpVHYlYi4R2RbJFK5NeDMy2+Le
	jokKfQDVMexudKI6iyuQwpBFZiseJ+KrR90USl8Bi87aS4AJzYf99ZsYSADrCzcOK
X-Gm-Gg: AYBFou07/px7nABCz45r4Pv7/DbZZv8r4NJNdCHC7HK4OU0QUIoWuaasIJQcBS0eYP0
	MFdY6n47OhSTgV6dqdBTo1iIQzwqUZ3nSToCw6cpu2v0TBaZNtp6epiEJQmp0Vq3ngo8q5skJ5U
	M0q3bKnBjHLeKn55CO17hzsv6sGG+rNdeQ2ebzYnCzJWkD2+tFQRI9ugRdLgXNvdkHby6XzyjOk
	5UxGIL14zTM42WQAPcZ0IKwvWQtvI3Y9MustipEobWKfVLhTMExeu9+Lz4GWU74JKizRUCcJJVh
	uUGl91+AcMkvzz9ZrxqquBC6Xm1hnQr1ACAuIGmI/uGQKyAiR8wmF9vDlzTC8ipoaZUVFxV6V97
	y5n3rxh/cbyxL8y+i
X-Received: by 2002:a05:6122:1b82:b0:5ea:dbae:3cbc with SMTP id 71dfb90a1353d-5eadbae3f05mr663475e0c.19.1792501376506;
        Tue, 20 Oct 2026 06:02:56 -0700 (PDT)
X-Received: by 2002:a05:6122:1b82:b0:5ea:dbae:3cbc with SMTP id 71dfb90a1353d-5eadbae3f05mr663468e0c.19.1792501375911;
        Tue, 20 Oct 2026 06:02:55 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cf04ffe9sm253748145e9.0.2026.10.20.06.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:02:54 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:02:52 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Xin Liu <xin.liu@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v1] arm64: dts: qcom: kaanapali: Split cluster power
 domains
Message-ID: <c7kpksiq6y3riziq27gogegfcybzhaxa5v5d5z5ajc2m3o2dwf@eebruydbwutk>
References: <20261020063721.2306679-1-xin.liu@oss.qualcomm.com>
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
In-Reply-To: <20261020063721.2306679-1-xin.liu@oss.qualcomm.com>
X-Proofpoint-GUID: n-QEOBPRrZq46PjKTzLI1YmHXDYAs-D2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX+yHvISLl70pY
 IoF52XbPluFWbX2NmWlPzbgFKH/dqEEkimZS/ItRvXja+eK1Pjc8Q6DEehKz2WbP0m5r6Zbobnw
 g0Y7VLukqRsWtTCS1AiHVBlviV0fO4o=
X-Proofpoint-ORIG-GUID: n-QEOBPRrZq46PjKTzLI1YmHXDYAs-D2
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad76681 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tEwKlQtQ9BOrozrowe8A:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX5LW2vmadkep0
 poiQhFIanzCYGT9MckaBfLKdPE1HMnfre8Hip6WBzAinRJJnoGY+tPBqUFrMFzFzxT0VyXBe2gy
 FuNpqKq64T88BbjivaO5QiNoSHeYGlp97+7+8fTx/K7Stkbz7fMubAACzG2bv2EVM7wQ7kbK+QF
 8eqbi9/i+HOiDG02SX1XStPub8XfdrzI0LaVrN7nRexiT+jznB0lPONdPIC1RRAyZPnXQcEgWcS
 CaVFjD0w8kzmw/bkiSaxdO1b3ksf0n6vcPuIhNTl+g+9LiR9LSfMiuG46cUMh9p5JIoer6q8tuV
 12Y4Rnm5SXOCl9MvtlnfLg2naTHqer/+/CGhJ9wUcoyDn3sDn8cb4YJrWsK7OjKSPgHi/GU6dB9
 gp9VIE9s1Et8MkWNEYDAMTnta117GJDfrNNzHJr08n/6Ug5eUHTmovbtLe60uoELJFF6smtWWMl
 REB+AI4CNVElUd5kPiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200051

On 26-10-19 23:37:18, Xin Liu wrote:
> KNP has two CPU clusters (cluster0: cpu0-cpu5, cluster1: cpu6-cpu7),
> but both share a single cluster_pd. Even though their domain-idle-state
> configurations are identical, sharing one power-domain node means the
> kernel's PSCI domain idle refcounting merges both clusters together,
> preventing either cluster from entering idle independently.
> 
> Split cluster_pd into cluster0_pd and cluster1_pd so each cluster is
> tracked separately by the PSCI domain idle logic.
> 
> Link: https://lore.kernel.org/linux-arm-msm/1ee9b624-4580-4650-8e48-d517ce9eee3d@oss.qualcomm.com/
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
