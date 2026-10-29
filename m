Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266757;
	b=SANa8HNQG2db5tGcB+PN7VZL3A0lhkqh3tuVjSdtm0/c4zvJYYFlpHhoV1aIc4eYty4G
	 hMoHxEuaq+0UMDbB7s64Cy+MIwmgPLA5+8m3SOPkFOm/ugpfPyN1SBWMrsnOsE2aJjtmH
	 etSqdNIwXr0z93lCzG8NVuYOg8+3xThWey6bT02AO6IqY8fay1OPpX0g1TTbC4VDnCfmt
	 aJVgekpZI2FTaV2W39VHN8EdizcBRN3hM8j5jOiwo+TDd1r0eTlv6gJi2cwklyOomxzEw
	 ePX2Yy/7bIS7lesMjlzaaCkBE4Dlt9KyAsDVlH8HvhWIxbYcO6A0Q1WU08ahAbPAsfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266757;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RjSyk8ABwu6/513QWu3MJQFpRorGj5Zx2uYf4wmQKdE=;
	b=xD7t94T273XDFD+EzYX3bhzw0MRiiNQ13Ba7RJ9e2EvSWU4ad5PDqM9W5TZ5Ot52u5bn
	 N48aqTl5T26dh2CTMtDDyi8N/LW7yUpUwnVQB2QM1Uak7ti7L3IOAKQqbx5VmBqkFQZmx
	 1FvenXBRGbkZ/xe7NlpHIvwik6kT0elexTe1voj/xmYf02Ohhd5XFA5OQFZGH2BkTUcL1
	 xmgxmi9glqagyfYwNDKKu2CVUXRj6Z5pl9IxjtzOczT+ltB3I+kvHznu+0SOZkE1n0Vrf
	 +Asfs4cwKeC9b4DQcwsQ0otMQ1JwFrBjFJ4IhYvC1Stcn5R4Og98AExJeWnjmMVN+iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lwbdQ80k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FrAxNDPj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765D3606A320
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 09:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 765D3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lwbdQ80k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FrAxNDPj
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vSTW3457787
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 09:39:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RjSyk8ABwu6
	/513QWu3MJQFpRorGj5Zx2uYf4wmQKdE=; b=lwbdQ80kSkREwFe1vR5ZX+w2oyM
	6lSga4mcLTHgPt84OXBskO33v4cAcbYVpf9OlMS7yDBQ0OEB3FGRIQ9Y0CNO62d8
	E92V+i12o480B6HZJqreNcaWQ2ulnc0P4BhZa979Havdsu8CHCpaXl6OTvJGz6FY
	VyRwrZWa/cs69gzjYuunoqRI33SSi0YXlxHaAZKoqmK1AqY9kSigOuePBwiW1r7H
	2eHsGnRC4f+HXE5hxQ6nz2ox17OgubFgR+yfy3XrcAfls2kHHB2PIa8G1iI/MRKd
	rW7qdSRRHyewioClQdgnoO7qRP2Sm7cAIawjrK0nfUmkog35/7kjIh6vpyA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknkpb6x9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 09:39:16 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc7e92f36f9so1506579a12.3
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 02:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793266755; x=1793871555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RjSyk8ABwu6/513QWu3MJQFpRorGj5Zx2uYf4wmQKdE=;
        b=FrAxNDPjfESlF/MjW0eUwuxt4NXu+OBME4mwhBetE7UcNIzQtzrNFItPgk36u8WmFD
         hFVTufa9oJQbFkl7wIMhfBL49ysidE9AN1Zv+2THQ6tFPF+g5OpnmaKEeZ2BZm2Tp7qd
         UO9Mio5x5vhtnXOwZgP73g5LVdGyU61xptjd18BkOBymZcW6j/u2//OPKzYv+oCobbtp
         f3B2QOsjRJChOPwQh3Vr6o7UzZkFtSyzq4/fiR8SiXEvxDoiQTjCl026OJeEJW+MKbWA
         uUzx7paFpTP2kqDe38z3t6JnVcSi4of6Q0w5NTgfvBWDaFOdPb2HoZ5bxQNEglK4eIOy
         N9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266755; x=1793871555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RjSyk8ABwu6/513QWu3MJQFpRorGj5Zx2uYf4wmQKdE=;
        b=vG2WTPy6Zcvc9+29dcUvfg7etEQXE5N/ggaRZ7lJzSMeMLrrMy9IwzE7+QPiIT6iIU
         eGiHTM+I3AeQ5a8j14GZwt+VqHzg7hbIsNK/zcEeJFuG6vCnb5M96GNFX7/TB7+cZJQk
         CTV5FVgnKyxVZN8vMDyYMpSIGagxxbfwa/dUedKoMnHbEowdTIlAuOF1p+kn8NRF3gD+
         No3eQMqLkShQColcQZmyfXptnhc+rZW9tZC5M8VXtnCrXk7GCbay3GPuwZ/cWfFpbkwn
         V21/5ukNlonQM1PXARXXMOQ5QyMCN4fej5Iu9s4XNOXN/jPDjVpgC5Pofh4yb0cRtwpk
         +jCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxI3Il8uDLAHw2gXz9Z6w0o7p7IKGLIBrGFLn9zhYzXm8sxXbsNaiGAckE3Ti/5VqZ0e9CzAYfnWKxv@vger.kernel.org
X-Gm-Message-State: AFq9FYL6A9X09mUJ726NFZ7vGvIjP6QxdPiz1lqZC4VpHfVaYCBlgVuU
	WMVE+fCG3BZSxKcHBxlOMOrv7D3lI0en3vNvRfS2gJZMkFaTF19K2D+byLb4twGxUPo7LGqE31y
	GYtFvXrX2bHj6beP1PCys/dcLDR+nDHH25igZO8njRsv99Vi6VMY60nn/f90f5m4S
X-Gm-Gg: AYBFou3FaKcfDvvA2Xt7rUyF7n1Y/CWctabrvCuEArj5ymT0DD+4bp/xI9GdyCC9J+8
	2MGEUX1MXicUopiEQkWffwlQYPnuKy+zwld6bFTSF1hcP17Obnk0h+CWQsDuW9wykCoxf5QB1CB
	5f4BIjjFNW+UDZPsGbPm2ViojpAW44GHX+RjTLPpf+Dnh8NnOij2lM/sVpcDJwoHO6MGkeHQ1BF
	L5wEpGwMJ0cSwdyaVf9tLmz+lMSq9LpmMGgiVEu0Fapv9rLTz0MZNYZECfK9zFyKslamiP4RXMt
	isEemAfxxm+7IhBnWUKYXpbscsYngvECT75806RGikE9goho7XRjKsvbUzs9qDn7Bw5/VZMUtxm
	/aWyiGNqLfLhGY07G/XkAdpIHnWgjOFQN7iV8jNNxEN8D803x1yEPFuwpCEhXur4jeBC/HeC00V
	zIRB8MaZ96xiy4xtHVgR2CF3L5zxks+dpZSQ3n2MaEkPPKZN+I0gulR1rPqS7an0f9LbDMYg==
X-Received: by 2002:a17:903:1acf:b0:2df:aed3:2ac0 with SMTP id d9443c01a7336-2eb00487143mr48433375ad.10.1793266755034;
        Thu, 29 Oct 2026 02:39:15 -0700 (PDT)
X-Received: by 2002:a17:903:1acf:b0:2df:aed3:2ac0 with SMTP id d9443c01a7336-2eb00487143mr48433115ad.10.1793266754588;
        Thu, 29 Oct 2026 02:39:14 -0700 (PDT)
Received: from hu-sivagupt-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm31434715ad.65.2026.10.29.02.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:39:14 -0700 (PDT)
From: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
To: konradybcio@kernel.org
Cc: abelvesa@kernel.org, andersson@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        gopikrishna.garmidi@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v1 0/3] Commonize Glymur regulator settings for fixed rails
Date: Thu, 29 Oct 2026 15:09:08 +0530
Message-ID: <20261029093908.100286-1-sivansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028-topic-sip_cob-v1-0-80ab6704aca3@oss.qualcomm.com>
References: <20261028-topic-sip_cob-v1-0-80ab6704aca3@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Ju9kP84C c=1 sm=1 tr=0 ts=6ae31444 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=E6juKWS7BAkPFlJObQUA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 4PCDC6FewHcvYw_PALU_6nrlVqWEzjFg
X-Proofpoint-GUID: 4PCDC6FewHcvYw_PALU_6nrlVqWEzjFg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNyBTYWx0ZWRfX/0hh0+ITMrdM
 gCW5GvT7DNvrNP+PMKoeVUK+BazCkUYhVa5fEtW/gLHb/1h++5OV41h2D3cG8YXSIcDVFan/0w4
 fNnQn/z8Oi/V0+f6i+691THjujXhCiE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNyBTYWx0ZWRfXzUyaDpjQY1bj
 IPhz2HL2J4B9qglWqkLZiLYPj7kTGHwrd6yhNt5rQtyOLOhz6YDjFPX2+mytye+5RR9SknmoSiz
 PbjLEmgkNnCkZvLuJgJN70WX7OVquOgdJ3Htatx4YKWaiahLe6/fhgMhLrHfJQDEh57j9IajcC1
 k62D0Rc3YIXU8c4H/fkBccazoOqZ9tnXxoDacr315yZR/Pb/D3iGzjYcqICa4gTNuAxRVj5rGd7
 D0hVk0jbmKCebb0A2GToGMWd3Jq66hIcj0zquZYNE0b4DNQAJi3OEPJqmgazNT43ygHh9knUPxw
 bGHDuDkMRTEQoKcQQzDonW5PEkw/c56upaLkeqF/H4QcO489aO5n+nQEwfG0UaDHmeu+me8K+aU
 4iszDgVYH7cVVxP9EiE1iZlesRKigYOvXvbYBNSM3uAgkrZHc7nQIWcXgpAGku71N0NpmUExMi7
 sphu9SJOnfWajgaB+NA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290037

Hey Konrad,
> Certain rails are predefined and will ALWAYS have to be the same for a
> given PMIC configuration (due to electrical and other requirements).
> Factor these out to remove a layer of pain when creating DTs and let
> one have a better way to reason about the settings across the platform.
> 
> Glymur-SiP will be the next target after/if this is accepted

This series conflicts with mine.
I attempted to rebase your series on top of mine, but it didnt apply
cleanly, hence wasnt able to boot test it.

Link: https://lore.kernel.org/all/20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com/
