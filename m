Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF163AAF61
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 12:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788177793; cv=none; b=aeFpbtSQimRQVl98CSq+ThRj2o4srtZIBD/dDO1iNFgsLu013nFjz94UUaerEASZP8Pz0q/OuvSNT+OO7g+jDJ0+z52Si6do6kcQi6wI0DQ6r55Rzo7wckPCSBTczsi8NLtAo29UY3757sffg+hrRQvgMkd/2Axb5iWthzJe4P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788177793; c=relaxed/simple;
	bh=BLdIX4JmDDmCb/nESqUPLgpc5EXO7M0X8FYZInOGzg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZoExB3GVMqfDtaPekX673qqQ/pwBIFSomwXyU5cGwJ3FBiVzFfY7FwaxZ0Ch6dG5om8MqGPoNIvwBldWFh2h1vY1DM99SqJtcHLSi817uohcuHvhYqM8LQqYYfPhg6Akx0yRFpUQbGI+uTdbFLrYxnN66fFZC8kcjDW5D39CaXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/JY0HZc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c3r7YiXf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b/JY0HZc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c3r7YiXf"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VBA61Q3517812
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 12:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NOEJTVFIcyoSbwosxVwbkQo3ZwwxOkwI5Yd+ZvI7e9U=; b=b/JY0HZc7fjI2rEe
	xT3mbk9004ZfT32oo+urk6xdI7RATR9xcI0wgQLl82QLpzA8zl7cpVtqQ5f799C9
	pxJ2hQEG1vSTmAZ9SQa5u3DXe3+FzIJcYNPDxeIgydSaKuWiBhOQTCwtxRrj9Vmf
	WgmJxdo5AHnhCSabGjqeNI0o2znqkVYhNMA3ywSmpY/S2jRULCyBqO09h7iSDHhP
	a76RBS12vGNad3+zoDCPXXuJAbCiqUFcHHMHrCfrAidLlDeoba9YDvULFKTRX939
	TlhDfjn6Jn8iHNjknuFDNApafSGuRf4PdQMZB1tE0TiDiWvq4Gva/sjnJF5gmRfr
	uxtmUg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6h90nwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 12:03:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfd1772d8so8912021cf.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 05:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788177790; x=1788782590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NOEJTVFIcyoSbwosxVwbkQo3ZwwxOkwI5Yd+ZvI7e9U=;
        b=c3r7YiXfOKevrDU0klJO+0I5mnuVbJZot9ojdU56PxXeO2yIS6kPL8YU8oxQPJt6rR
         fVypCb+FLGTNMuLA1VaXP7FCRZdi3kvc9cLZpkmJ7w7TnBIiqmXKSukjKOo9u0hOmVud
         7Y24cZ8PE3JapXapJ0h7Ir2WFzB2Bw0kIWOobn8RKF+AKXPymyWUI92gNk5qtW3NZBuR
         /G299Hr0wUcrOM1rHVb1ewHoswHXcK+aczEotzLJiKVi+Kj+RdDscKiEsE1/l6QBN05+
         RCB4dDmxLbX4DhUhXkO/nBLnMyMSE4qhY+R+XpZmkifIKIR1aFaNhsfLhfgQzesty4Ar
         WhEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788177790; x=1788782590;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NOEJTVFIcyoSbwosxVwbkQo3ZwwxOkwI5Yd+ZvI7e9U=;
        b=jqI/TgZZ81P2PMUQQyp7k/22ftdd0inULTiCaeY6J+s4lrHGm3L+lJ4ISjPyckt2Kc
         lduPvvhOQLIMauPFc6o3CU5VkKrt7bP/b9FR6ArUoQaWkt5kt252oQz3w5x7EOXsuG/p
         J4HCJgaFDzsJzt2EdJzPcOKSWrHGul0h38k07qKmeZt6EyOgibrX9LsIsMFqhBR26Cen
         nGsaeMDCBXVznDNmaBrMXilhsBTF6q6prKf7fACPHwRfGuxgRiVmoHyMqjyz/du572MB
         6GhXgGDDjkQNUjTbCUXOnLcsjjxZ4eoxZv9yWPHva12uVhk4aq6gqJgpJwfA31y1ofpd
         mwPA==
X-Forwarded-Encrypted: i=1; AHgh+Rp1NeyZUmWlgYyYHedYUVEqknENiE6zn4bXcEGAchHTcpbAlFeSwsOTKcVFtMQJGMoy3V2Z5UNVLN77@vger.kernel.org
X-Gm-Message-State: AFuF++lsN8507jaA+o+14TgVZ4w/LYc+drreWNxCImZV0VWluVpAAJFl
	hlSZvjR3RVzWuG7BDZ/k+yIyNhPR0lD+zOVmDOf8IxJ1Llt3UpJZ0ilkKJRCUF6Zp1NLtXe6VDa
	eIPXqx5GILqSW/BB6MJIep7YmNalT0IqedRxmd7ZJNtw4BlgYuMnrOpkbi1olFtQZ
X-Gm-Gg: AR+sD10iwIgoDR5y9JI3UX83r1zgG1AVKgByFpSd9ipywrTAkJud7ukrL2UIUUi7T/a
	RGC3gEVKIrKbzWZqAPP9PyVSjj0Ar15uwmQYa8xrwXPGbW52SaWHxXIuqsphkLTI0tgpxeVOmtC
	V2fM9Tjxf3SjbPHBIt8sM+0fvn5u287JzIQRRkwP9abLA2Zv/93UowviI2tefSmU+AA6LBLIlXn
	B7Ceqg8q3JWWVIhsvoxUBmzKg7WPw77cqBzXRNkJQBrIl7LxaNilHM8sH2h6FfEa54Y7lS/SzeY
	hKauV1XjwhmlZwDY0OvQeKQCxK/OhD4frKj70OdzvOACIPg9lPiBh36ed6kp3/kFCF3SKnVqH7L
	p9D+fVUL1YzyD7+POxZXj8w==
X-Received: by 2002:ac8:7f4f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52fb95f4e1amr202144151cf.3.1788177789947;
        Mon, 31 Aug 2026 05:03:09 -0700 (PDT)
X-Received: by 2002:ac8:7f4f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52fb95f4e1amr202143721cf.3.1788177789522;
        Mon, 31 Aug 2026 05:03:09 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611b5c567sm3300432a12.1.2026.08.31.05.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 05:03:07 -0700 (PDT)
Message-ID: <adbdb2eb-0173-4500-af16-de0b7c251e10@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 14:03:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sc8280xp: Add more thermal zones
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260831-sc8280xp-thermal-zones-v2-1-8c2b89b4c9c5@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260831-sc8280xp-thermal-zones-v2-1-8c2b89b4c9c5@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=W6UIkxWk c=1 sm=1 tr=0 ts=6a956d7e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=ROVUC7vSL5sbk-NUvPwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: AifCLdoGdL7YdLE8mTR0forVkeQ8IxuH
X-Proofpoint-GUID: AifCLdoGdL7YdLE8mTR0forVkeQ8IxuH
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEwNCBTYWx0ZWRfXxs6OquW/zLVd
 8FDWImp2WVtwKwVB7yk7vmfN9vj1ton0j7Hqeqb7o6kSFXZvfE20UJ6m3lT2WmAoKdhIXCYPMKd
 TcHqHgNL8Kagv5bOcK7IlApArncGZl4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEwNCBTYWx0ZWRfX84JIzCl6tYX5
 64xEib7d+S7jMOeXssVfnshehbSN1rf6Jlb0fl3i3nsh3UT6cSJ9Nqx8WstCmovauNvReYppk3x
 uX6gYiNsLCinq9kmPXw0AQa+VtwS3reC18lrSpJgRnh06xYvFHXqEAFT1I/iOklNuedzCny3hgW
 OWHsKtqrH26Muoc2dgF/9lyas6ynGgU2GhySXV2obiVu0dIwffemRi0UVdNnIvBNPHed1KpzM4h
 uSc04zB3Kvya+wDv8Ct14/jKzRJBJc95TXuCzxnSejTz5Jwp32O4YEftiEffaWxdFrM+Oq8UJZz
 jugYvhSYm5parF8i1iggf5D/Rj3VRqalgbQKEjIP/WR8Eb8yrrXspjF8SbyMa9GC6batAIIJ3KN
 oH8D/1BEB2wMAzaOwgGnOH76kjt33n5vQJ0URNP0pyRm+ZeWjstvax7hLAHmqLtmYVRgI0BNztP
 D+z0Yih6LUZMz86CUzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310104

On 8/31/26 12:19 PM, Xilin Wu wrote:
> The SC8280XP contains a lot of TSENS sensors which are not yet described.
> Add the thermal zones for them.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # SC8280XP CRD, X13s

Konrad
