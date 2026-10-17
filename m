Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA6137C109
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 17:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792259457; cv=none; b=aKO7C4mOsLK8MYA7yTH/nBRuA3xpr6P7jaJxyJLQmGsEXyI5URbkRzBU0/RpdMpv9mvjD+201QtUIe8UI37cw68IAWJZ8cMIUFDcZiPolJ/hjH2BYjI6557IXIf80fCd9Fk27UCuMpACKbtdVjbLIYlfICexxIpVnRqPuBtWwC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792259457; c=relaxed/simple;
	bh=wr9UM0ewitf25gcnH66bfGnQjMCTzyZV8lf5R7ZwR74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E5ocKoWLdwCSgSr0YDZTy28GcFJKXWMswLl1U+2XUw7F9/DfN2zeQ3zAkINiXLaNAGe1ejPAYulP9dYVhJu4+df+1uhPf+DRfo4DMQd1c+tX42hgoR+jE82I8asgGhdBY9mdXIIQFQOwlBnWVp7xxLP9NTdb/tJbtCCaZoWme3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BnBup60N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LHq+vM7m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BnBup60N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LHq+vM7m"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGAO7B636544
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 17:50:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ACHN3RVNB/V2HynRAJQrVH6G6KIDRcWy3aGbMNcijHM=; b=BnBup60NVLrhzo4G
	X5EbGbPiVFHxVlcqfh0Y36TbGoQdG8k5DgKRSXO9vY2zzDuTbpwQUg4SXSsn+FFy
	c9l805J/WCwtL/EDDxXLJuFEPKd5HuYnHWK/13ESltSjTswrmS/gOcISCbxkO489
	z/OII2T6oft0Qjf7YqkyaDrfL7HukZhVu8pZu2X98wLAf/+fv/YNPU85TZPnBCT7
	ii43ThQ/JFQx5IPaimodpJ1etgjh9ZEB740kNA9oFoJptOUXhAmFsxpBDdx+ezl3
	/z8KuYjndVBIBe+IqlCvIGcCsuQ2BDPS+H67sI6ctaiiS4ZHg9ssezlB86cuaQBc
	yeAexA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc2a9hb02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 17:50:56 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1796648eec.1
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 10:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792259455; x=1792864255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ACHN3RVNB/V2HynRAJQrVH6G6KIDRcWy3aGbMNcijHM=;
        b=LHq+vM7mdtTdgnbpXdo6BFUK4enwizKTfboqRth+ZCxaGhq61x2xLo3bpkqzocuhEu
         U02hJTNxNSBC9DNWvCQYC7apvBqJTVcZtYN1G7vEgJrpBIk4735K/p/uUzrnig8LYYdi
         n/RIPPfbLcCWCPKyGIjRptlrReLUVvt+pUXfiszZG5yZRSN93Yrq/K48zGb1Q4SPDoCY
         DAcw5d/yplZT2VLsvDK+kK6JLvDftn/p8LghWBG4GMu0jlGWFNVUEDICA6wWXNUs7eU4
         D6LamtSsx6BAsDiu+FxfWnEmj353CC11UGnj36aaHP5uLIy+f4+qVsYisu3QBErjE2DP
         cd1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792259455; x=1792864255;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ACHN3RVNB/V2HynRAJQrVH6G6KIDRcWy3aGbMNcijHM=;
        b=1U3VZeMkpTnycwHT90+FkJHjQQIeGcVm7lKGlPq/sl4Rfst+gKYTCuahr2GxvBriSV
         f5FUG94IeF2S5p6lT8Se3fjqYgtex2My0Oxv+iQc3j678Q2eodK34CnxX0abjsGQ65zN
         cyX6iB5+qjmmA3UeyKouPKVL0Vhxq6LE98NS7r1vAOsJcysq2kckz4AyxL4lDER4qEl9
         znvVWXyMYHU29bzX7/01pVNvRBCVuuBf7qYtC6fojak+bMdXdAnZEEarzvUpqqy6VV4P
         EaLeJSdZIiJCy/jEofqhLGpmJTysk+PBbkB1kT2fbd6jjn0YZidaOL31777qi+XScz2R
         JXAw==
X-Forwarded-Encrypted: i=1; AKwUvBwQyRd+kNrB4YgxS4zrRKe4Scnv/saj9GDm2Ee2yF0VTr+sCbIBoGIsFgoAzoUXSo2EDFZZOLqymiIv@vger.kernel.org
X-Gm-Message-State: AFq9FYLRBVF9IYh0IfdsqfAq8wOpufnhcyeQRhuqEusscFE5u7Un/qF1
	hIkuMAVi9WHNQ+iSzj3unTftPb7p0xlbnqbT8Gg4wKCKKUK1uwahoVYeSDGgU5H4kgPKohEO32K
	ODe1KhpoFfh2dmg0Gfm2SnYWAhgctecKYtGW2IUDcYXwSY/C261m/JgW7e1ffSDls
X-Gm-Gg: AYBFou2iQn/ZFrXHsJWtnk6bb80pMUy0G9R7o4smzGX4LGyjn4bN+ElJv84dQHCLmj5
	7uSUjharYKaf/1ahcMd6PEET2iwVh00S3aB7TrSR2qF8pRKS4khMu8lRwuHzCIXOmtpYN/F74FY
	jkiZ+zhDevYbJ1b1FE590PqTf74Plp6Z0/EGhKwfxPMsUaayHseVexxcOpXHeUwNf0eOifYZqff
	NAB7G8IIKoieXfA+awPM/BKty2ROSfRoiEWWpyGU2yJDRd276/3sMUg1dWm3FwkhHM+4O5LQ4oa
	xUOgyFTdC1QQ5kH3nDn5zZnQOVyvfcM+ryEk6g3BBnhGEajfH8BRfljAZ5UlvQ7fz9l+MdC1Cza
	C969rw9tokF3nWiUS0jIaZiesMQ==
X-Received: by 2002:a05:7301:6497:b0:353:5d9a:9971 with SMTP id 5a478bee46e88-361a136a528mr4797501eec.18.1792259455274;
        Sat, 17 Oct 2026 10:50:55 -0700 (PDT)
X-Received: by 2002:a05:7301:6497:b0:353:5d9a:9971 with SMTP id 5a478bee46e88-361a136a528mr4797459eec.18.1792259454684;
        Sat, 17 Oct 2026 10:50:54 -0700 (PDT)
Received: from [192.168.1.8] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36083283478sm16608752eec.29.2026.10.17.10.50.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 10:50:54 -0700 (PDT)
Message-ID: <70ddb147-cf99-44fa-b6b3-0f15e6b60473@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 23:20:46 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] phy: qcom-mipi-csi2: Add D-PHY support for sa8775p,
 qcs8300 and sc7280
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>, bod@kernel.org,
        vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        mani@kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA3MSBTYWx0ZWRfX06xJ1Dso0JSw
 +WBfSzq5YDY1xywr7qj6fQG6SFwxNfJZQMoGHDJeF7c8FYh7yzeczGGJhR/0gIii9db5XrXIRdP
 LH+gOrEnWrxMbkpnIV0eyHkvjRmw9jg=
X-Proofpoint-GUID: jANopCy2c-wT52aAmGBwES3PD1LAG5Wv
X-Proofpoint-ORIG-GUID: jANopCy2c-wT52aAmGBwES3PD1LAG5Wv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA3MSBTYWx0ZWRfX9RonrJrcVcZy
 F2PCduU9GDjBMNyWSE2rDmK87Wdr3eqgP/Iod0Rpm2hLMyPcUIeUpKVB6zoK1eyTdYBctBWHS6b
 vdLL71g0iBqamWkauHhHGE8lQgJS76j9WiZx3IxfSEaoolYv8445dgV1pfD9Gn+J4YAWnps/Dxm
 q5PgE3NtNB+fpXCG28Kld/M2SWKs0G4MEH9ms7MnojIU2/jI+rFoeFafzIZIk48SvbxVBp6FuBf
 eKthEREJjgWXnfaQMGHInn5XlbNr6rkUefTtGdiEUOTSXzLJP0HhY8gTlA2HOBN6qUPCF3DiH6j
 7nAgBY1+ei9+49yg73vQSkeetZCnbh6SXxhDMIQInN2B9skcBm2UXh3jAt5yMJKZMYMGjXI4wgk
 DF3fYnFmYZH602EgFo77g9XlCP5dncwoTs+AotKnygiKB9BExkbyxicYAT7IQ2skkVcwRVEjxC2
 lP80JJvZMszdfQcUlIQ==
X-Authority-Analysis: v=2.4 cv=PMeaavqC c=1 sm=1 tr=0 ts=6ad3b580 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=G37XgvaxAN74JWTdFfQA:9 a=QEXdDO2ut3YA:10
 a=h3fZFQXOHLIA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170071



On 17-10-2026 05:24, Anusha Arun Nandi wrote:
> Depends-on: https://lore.kernel.org/all/20260917-x1e-csi2-phy-v18-0-6515b5255fa9@linaro.org/
This series already merged to linux-next.

Please rebase your series.
-- 
Regards,
Nihal Kumar Gupta

