Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95418332EBD
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177835; cv=none; b=N1raWjuf0gpPcVzKtJlbuoFSzNs7B47hZ9BqJ+Rtaz/ofXt/HKpOV1NIN3f/JG6bq5UHhjv5bIiHCQxfetibWVlj9tomOrZ8cyBqMyDcde4MAkMcicZzpQAevdphWnH822kFVYrjIu6qj8ZaXZ/p3vEK4Ik7J6BPurfFUw2wHvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177835; c=relaxed/simple;
	bh=6U2EpQbl70iTBwLkHktdUzi2+kfxjlaFpz2VtqrjLCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VEIhJPn6Bkwu5jhubpRBqHDyg4QKIHaXGOzV1tOZuG+k2RUXCtWqviOMseoEip7nExOV2yUzwuatdVmDg7pgwoWHO718Z4zOxblC7ldZqJRO834APlsUjfgwx1Sc4nQyOXLGmrbsQmj2adk+oQ+RucU6pDUjms9lHGdgJSx2Kdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yph8hWEK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N3DPlcGO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yph8hWEK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N3DPlcGO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xJ2g284156
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=; b=Yph8hWEK9U2jD+Ij
	kpO1+tTYRneGR8B5Wcgo+UTgf5jYgKzt84TevFzpHktkzjJ+vHUZ2K/Bay0zcmyx
	SsnJqms99SPsbCBjj3lX1+QorcRQ3V6y4TtwSPzsgaKRWiPIHP+LNiPvVXswPkjn
	QehB7WlBfn080Tadnm6ibVvS49Far4nurNWwqkibN0TaZUmK/cfcyDsaxQZpjBk2
	a5P+6foElCmP5M+s3+wrjAvRG6FKtcA88h0ZVfSlTqShm/goR1Qftlr9rU5mNftm
	ntFROFOgeBkAKHGC0vB4PW1767i7/ogCEC8+qHbgBrBH15z4jO6+qCMdRCo0Hz6J
	cA3m9Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6tk78h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:37:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51768e1d798so20028091cf.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177833; x=1781782633; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=N3DPlcGOMoXITzruhh5OS8HNvnNwCQG2ipPYTGZ7hyTdedUUkhrzRTA9EO+ToLDpur
         M1vKhzmXN1z6dmizR8hSUp5saAw358Uh/ZY2XBteFDQULqVTWn3/hXAHU8sKfX7n9ygx
         wS4Ja1zSYALQCoC0EjNq9LHGeYEqZNWxPNXRkVDvUXInt70QRe9BTI6IQr1iFdegr8p7
         ssxP+WNRFdJS+Jh231dnKZ5wrj+z5EIGLZ9zRgdZjgVYf6Ri3hAAVqQzz7Bg/Rwj+BUe
         B2LySDJfQ2evTtmNx+KbIZuq8FBiTxvlHRsP1LpO01r7Hr6cZ57LLWhm9JrB8oXvtHjP
         keRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177833; x=1781782633;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=C4j8gZhT6eudFg7rcr6136xCIhwzu7up8fE7xlkcsBatqpAgUif9+dvzGxY9cVaVGd
         KLEv94BZzwVgwSJ2tPb+CqT9sOge5Zh8TswLtJAW8HbKXjrn3paIR9L58zPSAwNlL9lS
         E6F2sTb6l/t3jiyex15cmBp9elh6QlE0sOl1LKOJ+umm/ouOemCk5+vldtw57KP4ScVP
         B07HO2m39jXlynOoUuZeBqtZt/CFgo4r+EtQ+zbrGDO/YHpz4YT4fmXaSTnnP/EHrk/u
         IYk5xtNIL/Qdnm0g4TIPZwafHglp+ytE2TygzJ9EwlWOwUzLNmG7fvdgxlFMzIDCRtf4
         4kBw==
X-Forwarded-Encrypted: i=1; AFNElJ9t4vuuUpjv2+mTQkbNKlz07qXBNnfDG7/Wf4Zt8ExTLkTf67CCuWxXGQBg8ACuhKvRiZ1AsOmEWr3v@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgp9k7g5syiavZ3xJU6aIhUSwVjhPTnf/p7mFVqTqDCe6v7sX6
	Gi4YEe1IqVdmByKobJd2SjFZqU15CjGlbrvIuFmrL1L7OTMuzty8mXbbu0j4HALJqvcCZWGXGBx
	nXG0t88S6eXTzWm805eQd/uIV7s8Gt4vWfcBQcxoyhkkEvAzenCIXx0VwavsO12XD
X-Gm-Gg: Acq92OH8E/ZSQ8UX3XbDOqbwTxcmKl5epy96Qr6Xs7tUGnx3etO0rTNRDWm8EVk1j83
	82C6Ex02kfeAR7dFdMckd1mSvXKAi2El7cp8LahOErVnbnQFZLvwaZ8a9ePoJMZ+pCPpVs353uW
	Yx7rH9mpGS3kX+39wq+sRBVf4wW7VfXH7KjRejymxDuWAa0PaqvCCZGGvu0J/4CxqQ3BVV6y0a2
	fc0t/+pUBQbFp7IG1MNINHK7M/LWnrAPp0Lkmwi8lyip8Dcsr6tUjGCDjXPLiuO3IUt5/oXSuxk
	lAH3Kz3VF4US91hagLqXX9AUTsbKcrVlOFKHaRhmgLuBjpYP2qI45V/pe0TeBvhh3ZOoljKPOFa
	/+kGVRxePwxH+4Dm60nr8iTtC3W6rG61nrKseqAEpWNfRG03kGJc3CRtS
X-Received: by 2002:a05:622a:4ccc:b0:517:6d82:9d7b with SMTP id d75a77b69052e-517ee1d205emr21557711cf.4.1781177833032;
        Thu, 11 Jun 2026 04:37:13 -0700 (PDT)
X-Received: by 2002:a05:622a:4ccc:b0:517:6d82:9d7b with SMTP id d75a77b69052e-517ee1d205emr21557431cf.4.1781177832570;
        Thu, 11 Jun 2026 04:37:12 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f147e2sm53745066b.7.2026.06.11.04.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:37:11 -0700 (PDT)
Message-ID: <7db96e0f-bd26-43c1-b565-8886198b1fb5@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:37:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/18] arm64: dts: qcom: qdu1000: Add minidump SRAM
 config to SCM node
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
 <20260522195009.2961022-10-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522195009.2961022-10-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX1F2EErB2KUZ8
 tvV7itwea91ZoMqvW9MohujGZojAu7eyWDpX+mOt1X0B1EgT6E+fDJvBMjfzZXJAIBuK/LTlVmY
 b+x3CH7GpnHUYM73PiYARtZdhKtlYYYdxlF5GXgEuAieHJ5fbxop0TnvTZ3Q6n5lVmr6UNLvKrQ
 TbMBoo1Hy8uLUjN8+KdlRL7VCC94vQ4GgxOOZwVFgiWonOuzfOU6MePhPADsYNrtPa3TG9dKOrT
 mw/eL6cIaApV6GVTS/nc1v0RT1YiMeyigelyjpUUu6YWK/vtIq5kgz1LEHeoQbub6jaR7tqdtbk
 QDx/BqzI8O0U/RgZ68ZZealgiPQjow21o8ZlVCKckkxps2TtH0whDt3W+lfLLKVSqqjOIMWrEpR
 u7sBK4peRRtzQK65XwKn0mK3pnt5BNO/+STH3Sn5Giaw079Fb+owmMuLloxV78GLrZ4l5Vp/aMj
 2vG/5fqbmWHRgjOWYnw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfXze/ozhPwZl+t
 KBkOHZTZQM6hy/fBth7zXj6sy4YMol7ByUrfxcL3cCoZlLY9yRuVlCBWgbhkuIV1Wcf+OsMOzH7
 KYEpY2hgC8wS6HExDPdRdK4Lop18DD8=
X-Authority-Analysis: v=2.4 cv=AaiB2XXG c=1 sm=1 tr=0 ts=6a2a9de9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ZpVAhvDm8T4WZmbhYYoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: u24UzuX7nv1jBbzNSlwY0R9GOYh1KahE
X-Proofpoint-GUID: u24UzuX7nv1jBbzNSlwY0R9GOYh1KahE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110116

On 5/22/26 9:50 PM, Mukesh Ojha wrote:
> Point the SCM node at the minidump config slot in the always-on SRAM.
> Boot firmware reads this word before DDR is initialised on a warm reset
> to decide where to deliver the minidump.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
