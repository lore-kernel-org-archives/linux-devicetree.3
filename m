Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B5544C64B
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388815; cv=none; b=lincQPrFfmO/j2eNTPrysW3qb7bATSQ1s5R/uu3K7q/BdCOHo4x8p70ng8Mw3fTU2mROHtbbQ+xfFs8yVyxHdhZu1F/cqID6ZZcowmWJp/iW8d3FXPgh4xFnaqkTOx4CzFdkMX2ssGK10zBDQwrDynwPMHZVZG6Al0mC9385WDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388815; c=relaxed/simple;
	bh=VpuCNzuMJrwEAHkSgZh2kSxsKdhfDFxxd0rHj0H+4tc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dBgAvpHrs+nq8heYCBuJMrRzFdk6U+0O2zlBlFEjoqx4tKJ6lznlGok8Dlkj+QGRHqlwN9Zwx6U5BrNIiPaom9bxUKxD2BcnNBv+e52yKcdASLsRJ/8hARJG3fji6ksQGPtNVEbde3wiZuBlqgI3ys6mzOrmqa3wID4ZpXqtjkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KXLWQALI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=awUK66P7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KXLWQALI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="awUK66P7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm1dX727598
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=; b=KXLWQALI2kburQDd
	CvzSipFAaBJah5sgsg9w/zQqoqqqXeG/0sdVc91XvUvassRJ/6acCY3Qm2poGs9n
	cx2wECHn6TO2Y+l4DedUX8KOnimUgK95yAuUG5EvnLTB38eE6hJ4z3C37qNBc0qU
	EWlXA1ZTGduyi8uZqqzqOmaZhGEfnCk5KhzY9IYnaShCxQj4AYMrcSRL9WZhY2Wf
	kyyfQYQX2xz8KHYoErE6Byw8AqihLhFv/BZkWLI+r/Hh5U22jnIjtXydEn/mGAup
	dr5S2NAARua/JodwNBGUKzUwmYOLiGlmhgybg1LpgCbIClGoT+lfkPLypENo/g2H
	Akhi9w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5rv8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:26:51 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-796bb209452so27760137.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388811; x=1789993611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=;
        b=awUK66P7HH4ytE4j5YF2HUroVgHX2zkaV3aJjq8wasmpuMjO6j5tSyw+mujuWM78Wg
         5FvtTQE6gVAii38q8/Nkya36BoCfiuR9N0X3zk2IPmfyKYBLQWIDZDHo3A0eXvi7GyP7
         no5LQ9JJVbUSxlbtJzUZ72yQMKgZFIixGZC6h7iqZDXXuALhrgagbZcspsLzjuZeC0CY
         K46MUreffS7gpX0epRDSS/pojl++FKyQkzBG1lTKbvN75Hr/gqknsWvw8nh88t6/U38/
         6x8lWQc/krLbSN79fLBvOTvyYWfnEqkGo6mpICaPi7zSvx6gIHnDEGQ6fajV6jgsqR9C
         9YOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388811; x=1789993611;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=;
        b=R0L4/kvKY9DdmubZoUjvD3/A7tki5aZY5HI3Eed2gdpXl8f+d88G+ipTkec7caR4Gr
         544x0uS83QrresvIMX9N8AmLgdVavEhh7tMQ1lMRybkosTAjtxtZUBA7UIj1+RwrSCTP
         Oz8MJHeHrJ7oVvUnMGWSVG9Jp5Cj72naScnfzMhl+uIADauigjUGjvEKScD2vhU9xgs8
         UfpANQmRfnYlT+DD5LpBmn+iMR4dhswO27HT9/N3TmR8m2AGbEazfSbR3jdGeonLyVkJ
         i6RzERoQNAsDb1fZ7s9aj+klWIdK9mL91gSzohPXiaPS1xbSCYl1//THzM9p+Oe2zo3W
         9Wdg==
X-Forwarded-Encrypted: i=1; AKwUvBzn61tfbHEkG6OA5gxRXmBmaNZDPYu1oXn2Bff00IyOZ4QkLRa1DdlAEQLAmeZ0EdnaCKv/9LQEPbIb@vger.kernel.org
X-Gm-Message-State: AFuF++mEk4n/HXlOhXgF/vAPJfNqKBnB47/aekdARc48U1zGBMk0UORN
	Qnpso4XDtXCTXDZc0opHnzIE5Zypg/W7K1F0L0wWc7Kenl3RED236e9fMCTcTl+06C+dxiIwy2a
	Y7hiqj8G4WMkBmCtdnAYHfvZHeNOT4i2dRooD2o0lVKDWZ9PeqNPOaDoOQnhC4qQs
X-Gm-Gg: AYBFou3Ry7+uClPgZPgnMgcfiFIQwF56BZ56NOw3m9abk5kuS7KohPrKhDLeFfRIdM+
	jvy09C+BQRmwDMUSFmM2u3OaNX/H1jbKH97ODH+h1pIUJdY5EGrn4f0uJdLrsTEWle8SZuTVhcj
	TnYBwdWNctZbg557JNHgUTarROq2LJEX57oKVk4daQMLpzQW1U1i4xu2uIYAbv0be0jK91eMXzi
	dc4A1BXNZ8/t/HcRbRiwV/dFNdH6w1OWUr93Jx9TBiMjfK4uK2lrT5lwmE5FSsZfmX2CGalGcpP
	tY567LM7gNbipgan37BNUKUhH58FYlqJBX5lJ8SoeSgjI9A3wZVxoA/JHGSRbJ23vtVF0Tvs8wa
	dZXFcVcUqvuTRSedfp19dkw==
X-Received: by 2002:a05:6102:160b:b0:78f:c6f5:27c9 with SMTP id ada2fe7eead31-79b509df7c8mr375440137.0.1789388810925;
        Mon, 14 Sep 2026 05:26:50 -0700 (PDT)
X-Received: by 2002:a05:6102:160b:b0:78f:c6f5:27c9 with SMTP id ada2fe7eead31-79b509df7c8mr375423137.0.1789388810548;
        Mon, 14 Sep 2026 05:26:50 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a046a417sm2363884e87.51.2026.09.14.05.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:26:49 -0700 (PDT)
Message-ID: <a8eba9f8-4f47-4d68-978e-8ffcaa837022@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:26:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/31] arm64: dts: qcom: agatti: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-20-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-20-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfXzSXZoWZKWDQ+
 pO7gFbc9helOemuVERmfHnYulDnH6ti27B3XW3YEGvVI0WzTW9dVMGw4epwg82Pe9xGcQceiFep
 a/vra+DG3SA/zy4QeDD4sNh+Y/b6S2E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX0ivv1fXVvFOK
 eqiFyHH2ephVJi0ldxsSuY7kFfCuHOlXFQHmKVfNQpMcCWJB7uTmvPyWitVtTRm7SGqpdM0jdc+
 QTlPTNWSbeaau9BQmLL2UX/l7yOMD2IXHW2SbW0wmpvWaGr5NJ7mWTqh9JSL+/z9Oto3hiz0USm
 +bsE4r2pDBhlC+hT5s46lgdnMKJYp1j4AswNEAKoF9wXAa1E/UhpH6nwy2B4PDj9weCSEJ4ye4+
 TPqa8OzoUzrrObRj6gQ88sC9Lm52RRC1FICtCGrJs2TMgs66RjZjZ3Yk0fbZythqau7lTQOcyBt
 Dyrl8bU/mzwkgfm0LBDmW3+ckq+D8PkqlfQhycsAOE9OgQWIS0ubCBHvnguuiypM2hcgX8kP0hR
 B+UeVwkAmaOXf0A64B047/NfPCd5ARDZRLcxVyR7Bb1qUJ3Ygl78duV06s4j0Koz8PE+Hh59Ubg
 r4/lc6td1TraG2se78A==
X-Proofpoint-GUID: ERewhUwMHNSDldHLvRo64mA6gdXsRFYL
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7e80b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: ERewhUwMHNSDldHLvRo64mA6gdXsRFYL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140177

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
