Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF633B8128
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 13:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789477327; cv=none; b=QI336tRI0Ak6rW13UDDCqoJ9Ox+kiqYaMwJQtjBta0GjzPKX+0/xxwb3IJVoX7IP3QoPMuUfoTURMWO/4knQlG+bdvgGTvmmn7K0VbpLrGaSmi70YzWszG4C1BK7mQYC63+TkahouwPFHnGd29fk23osL4c0P3Lju5hqGjhmea8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789477327; c=relaxed/simple;
	bh=iQGXphKryUmb+DAlTxCnwPtT4u12722nCx+SciMAuww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y2qYnp/Z/VmHV3N8QOGP08zk2t/NAlAqxtju/iOSYAzq1z6YW2uRV0HqgYSmMnf6GzZkBnoNzC2QaQdw/LyUzJ7widcmvUv85vttowEV0Iv3VFuHfo0MCiVBYUZRnoLkhPci0Luq4MiOaKIuhHqh1lOblHqSpVep8rExMl7dRls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aj3jLjwA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HJ7eSX84; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aj3jLjwA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HJ7eSX84"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD0Zsb2528390
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 13:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0TACi45iWjML+NP56x0bPRivduU8gk7mMqeeyrAStfI=; b=aj3jLjwAu7ygID7T
	vH+3qNmJKZDwABb/57fLhQ/8opZQhO+DaLSsRox2nDPpDcnrmthDhqWXNHYb22jp
	xLs1SoBIn4be9TmfFOxkw4d8qTDiZgy7/IZe5D2yk4S4E/EmleBDsZcXpdtbaZqc
	cUV5xhWAWWamEOrv+CL51filHnuj0HD+MNRbbQ8BYlN48DivDzlMA5j4AsLEK+pr
	FoZUMZJ8cdIjB/nRvV35la+weNEn86mTB+WocQyZyc4K+KAnxufMxTYm9WIpKYUC
	wbq1mWV24qOXEVeRLAAu0kUb8deVlar41fgcUqzKANnFPsbwUUJxobc7bDOYTn1G
	AWv/6g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qp9kat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 13:02:05 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78ff33b2292so51025137.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 06:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789477324; x=1790082124; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0TACi45iWjML+NP56x0bPRivduU8gk7mMqeeyrAStfI=;
        b=HJ7eSX84dmjTwdB5cYk7wS+ZlDGEHXx3NxuInJwpnqokziuBNUfmBlF0qIqBux4Rpd
         Nbzgob7QRz7R10TLa62lbXa6KQE7bCl863xazET10R0aa8idvdRqtkbbUSrBOD7/CuFc
         gYnKiYAgCZunVG6BC2JqXPSnqqOtdfqNkmrWopmAChH8hA8stpW95K9ijE0Cz5wgo/D2
         Zr60JV3Me+OPIZfCGVuoToTgpAL+0uoBCUtdXMKId21z3qw9OmYbfcpGMwgrmDg7Nukr
         8uzyKNyncNOQ57tZX3dsk7InSliq1Orxp6iJygHyk+kbISEojBSM5sHZbbbvvJsq/WDE
         Ssqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789477324; x=1790082124;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0TACi45iWjML+NP56x0bPRivduU8gk7mMqeeyrAStfI=;
        b=svwAczIcpfhf6hF9iV/Iia1jfJizw3cVKg1LmCQXargaqWzzW4nVKcW1JS1vzenfuO
         XcKsUf7Zn49oVuHowkyLjNXMHsv1D1dPIZE5Irybexqi7wr499NOAiKCSFzeZIxA3zDj
         y3QzGu3wOcdAFD3h7MJOntrsKG1OZ3245Ukkl0DXiPCteMpjM4aQKF4KDL+p1VxFF+D/
         A0mnGKlluyLGKruA+VruUL7HWUbDAew3UMIoLxj27Td04UxcAl90ol6X+SAfvT7JDtsI
         bnYmkBsNgtNYY/kIIE0pZs18TPgXDEcVOBOURboZX6EX8vsaUOKVQUTm3eqF9vNHHrix
         EXpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwC8dKXPwbZrAIjUpXOeNZWzqivCS5oA0Ew8eNZe6FWeNJa7WXARq1eQ0IMrjkBuHVWo2uW9MJSIpAl@vger.kernel.org
X-Gm-Message-State: AFuF++l8MbVtk1vlKMYMsqtqiyd5wxkS3r9gEMRnQe9FvFHIe0jfolYJ
	ItahqSs63yhxXH0qnZhEG6iOZbfIiXVCUenupBPgrmdw20O4Yg2tF2Z/0LgzqUvFw8Kgnv5aIB1
	/JGQpY9DYwQVLqdSEoxznEQTp82HxUKuc5B4RvBNtqimfG9Qh05gjGOTgC7rwLoBI
X-Gm-Gg: AYBFou06oNIMM1WIqqO0T/p87EzwPwTcRhLJWFirrCwEA25V68DII1wxGLual4CT/d2
	36SaDqKCmp4HcC0pt4YvRRn+Y+y5H273DmVszulzdYy2TQM4Vz2e35noHK6Mh9AxvS1hNAciNAM
	B2mPU9+aV5cd/upX+g2UieOalXu7Q55sSfWElHmKEqS/0bpdnyNeep9oVnb/tgbwIqC3S9iSZwT
	EjcJmfLRy+e9PCO04IG5R3i4UzmknJJEYmQrcZ1NbN2kZxZGfTQa1JwaY6exMap76JPU0kt86PU
	xD9HvT+ZHtfXM9Y+3QJtxeOO7NSPRkuaVuNVrRfpnr8HuR7fWmrpgfOpOGhnp0rqWqNXmxCKnJe
	063x2Ck9CORnT8mi/DhwabA==
X-Received: by 2002:a05:6102:50ab:b0:799:e864:aaba with SMTP id ada2fe7eead31-79b58b76fc7mr2190662137.1.1789477322070;
        Tue, 15 Sep 2026 06:02:02 -0700 (PDT)
X-Received: by 2002:a05:6102:50ab:b0:799:e864:aaba with SMTP id ada2fe7eead31-79b58b76fc7mr2190529137.1.1789477321202;
        Tue, 15 Sep 2026 06:02:01 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a3357673sm33700881fa.31.2026.09.15.06.01.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 06:01:59 -0700 (PDT)
Message-ID: <4047a1ea-f105-4b8d-86c6-8176ed58d9b4@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 15:01:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] clk: qcom: rpmhcc: Add LNBB clocks support for
 Glymur
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260915-glymur-ufs-clk-changes-v2-0-d0aa1c60c269@oss.qualcomm.com>
 <20260915-glymur-ufs-clk-changes-v2-1-d0aa1c60c269@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260915-glymur-ufs-clk-changes-v2-1-d0aa1c60c269@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE4OSBTYWx0ZWRfX8bq4a2KmNFDJ
 VND3rM5Bog31+V48yv80QhEP+VgmxgFx7VxJQ2CNkMUpRdjGMnxQKLfaqh9vVkjpV+LxJt/WyyO
 Xakq8bdSa7che/qrth0WQp3GhwizsOc/0VyRhunX/bDINTCSzdPk4DWFU2ELVNTje1jLWyhBZy1
 r1Gr65VUETQw01cV+L3KUfY7al1DngqoibHdKvbWBC6Fmf2lhnO4VcW4rewwHauPfykoBgsxdHv
 Z23sI6vZ45Puohcx328A3UsrIMk78s5u9OelJJFUUbeGLxU7YBlyX4yp0vKuP3cS27//TCV3wH5
 jfhx5PE7hx0iMJFAq1j9nF1jMYOxKM7yBce4NL0HHHFswDt95vQv+MIg8krU4OGdxChW5+puOuu
 U0+kQ2XImx0gMN3TistrfGdSwqO3dQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE4OSBTYWx0ZWRfX9MC7WhiWSr1V
 iDqpyPmL5wMn8+4WlxCnwYif7jpqRrQneF6TiKLiPlJjYvpYtmjWfFrD5h+Zj/AwtoIlVRxAAaV
 q75Qwc2U5S+JNcCCaG7aFsRR1LXKpqI=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa941cd cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=dHuaQup7kaPGrqMl_VAA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: 6YKN2cm1Lc4_LPEa38zBeDPIuwJUilsc
X-Proofpoint-GUID: 6YKN2cm1Lc4_LPEa38zBeDPIuwJUilsc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150189

On 9/15/26 2:07 PM, Jagadeesh Kona wrote:
> Add support for rpmh LN_BB_CLK2 and LN_BB_CLK3 clocks on Qualcomm Glymur
> platform.
> 
> Fixes: ebcb9db98bda ("clk: qcom: rpmh: Add support for Glymur rpmh clocks")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
