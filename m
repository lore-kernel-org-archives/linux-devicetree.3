Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995297;
	b=Nq68KjbKIDY86Qw4vrD3sPgzHc870Xvpmy3At7wpYpx+n6M8AHx5GPpVmHTmhqq3aPLw
	 R21dFG4GnFGMh+XTU00vTbxEgDhfoA6PY/nilOr/ZnB1ZvKfUTuhDn/yib60UkTrZ8KnG
	 mFD+WbJuwj5iWk4D0ymOpfwAhNlRjnVCrKtLgL/JxOlvTzIpHaxw+e0Z1h01k/tEm+XpZ
	 IA4/JzIEyb4wu+pBV0iD6l21ZQEsKQkHZFc2XjCnbDo5xPdeVZRjQSLwKUjJsWZzebzS0
	 geioAWHuhhQV8hhrZGz5bp2rsrjg2CGZbV4QtpHT/hor4YFxNGOEPqL0W/NU70ap+Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995297;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kLnvSYRMn2ne36NTXb1nZYBaoMvTs9kFclp6tyj7WCY=;
	b=XzygT65Xrt6W5tTcjKtrupf9C1EkcXdIYmuH+ID47uihwBXPHeiXxROYLuRGpQDcTabH
	 FLpBOC7QrsjB2dxgvwRkX/9EFu3lnhnfaKRYR8iaLmAH+PRKNnxoLgSRY8xji0dONDvhB
	 gC9NdDz2eP+VgNsb1K5xI0F/BlS8z3f9kbZjTu7f5+cj+CmaxItEDTOZ1jZ0HXWSdK2jH
	 7Wpc1OZ38py3wWaHhoHCSDwShKMet+ZjNepAGQO3vaIEwDc4nUMtyUXRz11LmriYXLPhQ
	 a/mPldtK1FLPImRlUywVmDXEhXVWwA1WUkAo4Up2jYjOKFOykVxKX4IP9whPP4pD/QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hFVEUO5W;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=drA6BBiF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AB4606A334
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8AB4606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hFVEUO5W;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=drA6BBiF
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI9lerT835341
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kLnvSYRMn2ne36NTXb1nZYBaoMvTs9kFclp6tyj7WCY=; b=hFVEUO5WeSIobojN
	UVIw2O6MToBWX4CaZBcpZxtQT820QajyDdXRy9Td4vVQvTRIrizSrsWqOn6o3XdK
	mCy5dhWkjoqFP/1KPXqA7Kj6uwsXz2HHuMtmc2GlfWwUKfKVY2M9RxAzEdJ9dNMb
	qvXAs5AZ+WWCHY+sI5Z0etjtbE3iyLI+hvwnDhE/Q6dkEqPX/jHDMY7jONEedr/p
	XrS/9PjpuiOlCxdS7NgTLWz+nyZjaTGK8XrVjLrJELW7yreeIvdb7rYfdbuWncg3
	ZaZLtZimYJWULfgwezkXIpGgMfkik7d5s9PuQpSOuOmtDKYdG7daBxUCL+X4siD6
	zXm5lQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvcjdqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:48:15 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-89e05d31e54so714300b3a.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 01:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794995294; x=1795600094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kLnvSYRMn2ne36NTXb1nZYBaoMvTs9kFclp6tyj7WCY=;
        b=drA6BBiFKQRvXjawVSxnk0rsv3v2tUC5+6fTjFIzJZlxgNiYjn3beKYb6ZDiTCCMXl
         Rd6Ew513IL+0exjvSG824u3na/grMh5w9dQ5uirOzfe0QAIvERiSezA55AkUzoqrx32A
         hxkxsoxjwHUUva1MXGOm5LvOBc1LsGRp1DY8FST9EQ0iKm9eMbOYNENPTET+KlhXEx1x
         67QONNl3vStJLPkN1hG4LEG61S52VT8+79gIC/dlQblcNkmPSbmZjtbs9k9KHOju+/mP
         WT85mALYaA82UlmWOa8+rvYP+84C8AX3dYbN7337SvLVBjj/Rmh9noEQj06h7E8lYIKr
         tugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794995294; x=1795600094;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kLnvSYRMn2ne36NTXb1nZYBaoMvTs9kFclp6tyj7WCY=;
        b=iC6wEQifAF0YA3cVUCHW+3AcgF/6FriAMqyQqxBPjoPiLK8RMj+g7QPTsuY1j5EER/
         wuQDDV9w4SQBgK18pk2ORfvHWCWsP+b1U4Dk1H21l03XKnDZVXsO+SIzYmywAtSM7yBC
         ww4mkOEMAv8MEDx18GInMKoUAYFL+MdX1hrKaZkXxs3KlxQkkK2juv6iu/Q54KmIctSY
         vrzOTBtbjA1F3dIc97fjnUsmJrSSJ32/3BE5VucwUbfqCi+3wJxc4MIVE6biHzFFisMe
         CFnVrsRj8h9t5/7bBS/07zVlKlIcxxxeFQ6aZK8zzC15TX2Yes/oPsuZbA+/JeV28f9U
         ivuw==
X-Forwarded-Encrypted: i=1; AL+hErHwJMyz0/bypoZKBzNnqWVIvs0EvYHQIE/JTkZ0zVjOse4bNtEku4kKrmtQMtU39S0IFH7Am0vbfVHG@vger.kernel.org
X-Gm-Message-State: APuU4Z+o9UF4nUaFsIx9Lyj2Aiv2F3rwsCiIjQv7irCmGtIYJQ7NP+3X
	OwD1SJolpUOGF07QL+XACNyQ70O7LbzJmyOE4X2IfApPpmeTEMq8ahZFIzvMNtOVQETMArlz+91
	ypdIFQmDL1BUff78xd4PPjPkLBwdWJ00wwYkvEe+CZysR+IDV+Vg7HP3XY77D364+
X-Gm-Gg: AYBFou0XknZ9qrmhOgL81y7HQpiqbRxodeae2fLeIQX0YbkFCR0YBTQvDQN9wGrE5Ko
	qeat6iIypLAqLr6fCc/PSlgHhb5bU2gallot6eyGpAXSEX6LJtPowOhzcbkdXf/THfWZ7Q5Xo9/
	EnGHJOoECaK6GISb297WBW12mspRwxeQ41xR0SZperGdux12X51Bdr79a9T3Y4hBFy1elwqg4UF
	LEd9m+sobImuhdtrYxv7R0CTlgT57fWUtHyPJ7E4Qzcz4+jpjFjXsNXhQKE6/r+ol1LcD11+5In
	cy8Bh7z1qBSyPKeS7RajITahLxos3lxTDGq2v8BTWBeTxWVy7DItQBlxKH6agChZ6csv+gfQjzN
	y6tKGhWymB6Wlb3KiNV4Auz/42JnyLQBb7lptb/yej2ZnlqVMlU5Gi538oFbhBoZkue6QuojoGJ
	qcq8I=
X-Received: by 2002:a05:6a20:6a08:b0:3e2:7a40:a566 with SMTP id adf61e73a8af0-3fe8acfad99mr2273417637.45.1794995294249;
        Wed, 18 Nov 2026 01:48:14 -0800 (PST)
X-Received: by 2002:a05:6a20:6a08:b0:3e2:7a40:a566 with SMTP id adf61e73a8af0-3fe8acfad99mr2273388637.45.1794995293773;
        Wed, 18 Nov 2026 01:48:13 -0800 (PST)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cb54e413sm938597b3a.43.2026.11.18.01.48.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 01:48:13 -0800 (PST)
Message-ID: <61542423-9ad8-4791-abac-3745e032cbf0@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 15:18:07 +0530
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
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: glymur: Add ICE node for UFS
 inline encryption
To: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261118-glymur_ufs_ice-v2-0-7ef4556eea15@oss.qualcomm.com>
 <20261118-glymur_ufs_ice-v2-2-7ef4556eea15@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20261118-glymur_ufs_ice-v2-2-7ef4556eea15@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd745f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=SooqmcQUKh5i17ny3PUA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: ATU2bzJzBd3ApFpw1vMEnFBDuNtndMIj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX/0xwBvuTRwX1
 iVe/O8/eJce2Z5F7pVAzysPcmnw+3glkCqV31H8Xv+WOasXFRk1NGrbxP875gUsNPoKaQeV5VwZ
 aI96W5bXELabDzJ6XdPzsPxdnGl7L2s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX4RKJVQk/TyW4
 TE2RlFYna8DecnbXQnyOG5kFyceeUNnxRZ7knxuTwmIoh+8ydVcLOLfBCDsBl/rm8P3uKgzxtyg
 DqhbmYSmhWd4eHtxQkMwtM7c30Gkl2Gr+DEDcwJQn+g5PwgJtKyBq3OrVbD16sPgJ4JNoETQIXi
 ABVbx4yKamEr8rZPWZ5p+q7MeQF6aMp/pw39qjOE4VLroNsMPf6fO3d//8c3OahpljC1qYm5xSC
 5Od4x9Mmg3nDqYCp4Lqshxi8ZNF/7g4ohhdjKCi+0ccydpvtgDvXzoJ4VI9giX4yhgt5hsgmnaK
 3NqE4LkwzrOQ4J5TWZw0lNlCCj3NjDylaKuZd8wFp8Ej+vcOLqzfpTnOxxBqRrKJg+K9nm/ywFH
 brksoKrCCieXR6jPos6cpxTXycO04HNbupJauA4Bh6b1TjOvW5JX2tA4vQrghVuPowHlZNMIHfD
 iLntMQiT2V0moN7MoiA==
X-Proofpoint-ORIG-GUID: ATU2bzJzBd3ApFpw1vMEnFBDuNtndMIj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180038

On 18-11-2026 14:38, Wenjia Zhang wrote:
> Add the Inline Crypto Engine (ICE) device node to describe the
> hardware-accelerated inline encryption for UFS storage on the
> Glymur QCB board.
> 
> Signed-off-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>

ICE addr/reg and other values are correct as per hardware spec.

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep

