Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F31C4B2CAD
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 09:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789638843; cv=none; b=HkZWx+ByfyGO3VJqh6sWApFOogSzyIj0elcJPCuvavJWlgRiu75NWvDhvGlFnleSHAb5lOCnjrIPpuPyORiBHODSKKu+0NSR10St6GAT73gvIXZYf92Gg6PcEeKkmZoCGBoUyDvsPJc8rz9slP18eReCz+kmMpCPKraddUlGBik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789638843; c=relaxed/simple;
	bh=Cve130myEL9inyJHbquCFXzlJXeFLlPCSP2ZaBXKxNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CYD/6s9kRe0zCyERrHw8wTXLjwo4cuzDwiZp48qbYyYXcNseFPGElLonsKS5GJjB6CrCTk9+NjWF8GkIkxCsBgXQtC7kSU/0+qJqbYRdB4ne0wXOIFe/HJwNmv/T4ZbV82zV+cLLF7NbpJTvj8YJwPX5WIfYzIb2gRH5xObTAm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ejIHOTYX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VCHGC3W+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ejIHOTYX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VCHGC3W+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9a3cw4187018
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 09:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D7idV/SmHuaFlrgRp6yA6OaUWlWvXCzc//paIK5S5A8=; b=ejIHOTYXd+7K/NKL
	fmqCwe0oAAkmWpSrf1jb+S9hKpG/SVZYu3Rc5ZJdbURb71uvDdLtk3ZYHf90bL9b
	EJoLe2RkjC1DcT3lKSWJUZ0W+WawpExtxQi9yZQMQPrzaonEkbkAJBp5byR6m7nb
	ePfzvRaGN0An3EEJl/4365aruYCgb0BftO5i23kjrw0oZfUyCpp4dI5JssvBd31E
	jG6daaGGnuPHV/TuiOzt2rvQNUed5dZLk/cmUJQ4N3fYk06yxh6MuSDxeTHd+h8T
	yc7A6bP+X9J3V0IQY5vj/5/9VpqPgz+dMaEZcKN8cblAx20YhqMf/dxY0jRvfcyl
	tGc6cA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr7uc9j4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 09:53:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93821883e26so25281485a.2
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 02:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789638826; x=1790243626; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D7idV/SmHuaFlrgRp6yA6OaUWlWvXCzc//paIK5S5A8=;
        b=VCHGC3W+SHpUaE0QU6E+1D9Apqkn3JFrCI/5Skh/B0vT0sY5Hgq/2UKzPD/MkqzI/G
         jeSoCtLZUzZQlXQkhQea5Xo8MXr/sFxbV6p+dlTGyEWVeK2DoItJNArpmdbAmPCiSr2D
         Dcx7CfinEAC6/seCzBlrGBc8uWOQDdMf+MR0qFDV+mUYM9KnumDDe9RSBSxIruhcBEHg
         RspsoIRx/1EVXCnpIGLR2tBcaigWynjvcNb4tI++lcMtu8qyDP3mpqmt/BeflYq65xr6
         UFlw6qtTe/Ja341K9QlNwQvoqO5LOtmcd/n/Xp8v9zHafM1LEZOxRNkYqsJNmkMfCPOg
         RmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789638826; x=1790243626;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D7idV/SmHuaFlrgRp6yA6OaUWlWvXCzc//paIK5S5A8=;
        b=s4NBAWhikeqc6ffJSpkoQJLGgzRmCgRErtS8recjDZGLnPvODxZ9xHPo9y4QKJFi4F
         hqGXUQvcPfm3hJfjiqlEJaeYS14PZdpNVyErSTUEx/hVEA0PHMsBMvZlNxVr9r4iJC5I
         uZtjaozS6PEng9NjGaS17jK1gHJI3lbZM1Mf5WalAOX65nXvQ0jz+Zdyf88kdglEjdZj
         bmm8cmKHY1FXLfxaEoBQVvtUBC9I324FI8GR0wIepwvnIBu++Voom8TAzaM4BAshlhFv
         sDSok+9++SeRLkFne0PatY6TNPYCc2nfXepEgWh2EdQoDfyMgRwlDM6UEof9Rjixq6hg
         o/fg==
X-Forwarded-Encrypted: i=1; AKwUvBx5Lu8moY9E0UNSqzgEwTOwkPj/0n6jNP7feF9Reo9lrwXO0PmY5Xg5CZ5IAZBkrBgLUA7dPqMbmcqm@vger.kernel.org
X-Gm-Message-State: AFuF++nkVDSELjmOw/54mmp1kg8ZJEqL9BqibxWQAn9P3MC8Y3nz3Co7
	K0cgUichl1y/ayrCxIm0fNXQxWrHnkukiWxmVFc3TxaoNfMYQQ3zjZWkL8SodI0GOvtCcfpdp01
	YNGjnkokMn4+ad9WURgLLXtbYGdWLt3HOqpD6eCqELNQp9bb/JxwwUnDLASO5iNLa
X-Gm-Gg: AYBFou3IqnX1SGbdvVmDrtKKYD0ClkyGacaHCaB0DQ2aCExaGTV0opnaQgWWRjjFI2a
	2t8QwitHJjNW1+ZNr+FIj2B6ghL9CV9owtvUl54IYZSJItQn5LTNcTXsSyfob2pZc1HNRKKjEPX
	5ZQveQi2H3ZT2mxe1NtcsLWz9JTMdQlpZe2mDbv3TkNfjEo6T7qE93DVFP39eFM+UrH7srv9+9b
	/7q0GlL/xikP9NctUfDjSTg0RF5xsEd8NiOnqnvNsNAZyG8SE7BOgT9oReZUiKI86vN98GVLdhq
	3/fs1nyM4kJB+gaTtCkgATBL2CdPFo24JHwXEO/83g572TknR1v08rE+crP2UlbyrPljzzkThlD
	U0JOVBqGEYS4K0O8+nghPkA==
X-Received: by 2002:a05:6214:508e:b0:912:3128:bbef with SMTP id 6a1803df08f44-9124ff4e920mr3296146d6.0.1789638826419;
        Thu, 17 Sep 2026 02:53:46 -0700 (PDT)
X-Received: by 2002:a05:6214:508e:b0:912:3128:bbef with SMTP id 6a1803df08f44-9124ff4e920mr3295926d6.0.1789638826034;
        Thu, 17 Sep 2026 02:53:46 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de602065sm254533866b.47.2026.09.17.02.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 02:53:45 -0700 (PDT)
Message-ID: <d8ae41d9-2312-4232-ab60-2f061ac5fdeb@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 11:53:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/2] arm64: dts: qcom: sdm845-google: Add dual front
 IMX355 cameras
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260917-pixel3-camera-v10-0-df631279b39d@ixit.cz>
 <20260917-pixel3-camera-v10-1-df631279b39d@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-pixel3-camera-v10-1-df631279b39d@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEzNSBTYWx0ZWRfX2J1YQNpCB2pk
 BKV3I/HsPFKrYtyDZ6EOLN8RoGlAfea1Wi1bcLo15mXKumca7+PX5khpa3jfQwWsRKytMNCvlxt
 kvcn81Lp5IbD031SlS0bp2WXOEr3RCBjwbfs7cKidpQEzIhXUrklCrQEG/HhI+mtbxGQsjzK92e
 RKRXNpYw9jhCCVqvoUF6AlDQXOHrTkW3g1dwxvBwpes3jJ2u6T1MbGBHPLzJ1D4cZ4bBdyxpTNV
 Zg4LgGfSTHuFANa8XwvxqGPWcWG30D3L4jYy+CiRAhd+oFgO31vpuW6Li7rSd3lAbm1wYoNBToa
 bTlbjOYRQDGLvQPzMBiro9PC+WS8zjyfEgQBGhAGlNHil0c9JXbpHwoIHxkwh+B+YiOWntE5uCt
 b4K56/k/HCivi4izg5WQlkIZK8n7i6C21XhwrlPohBjsmQW3yxlSOkHdAc4oxy+KGflUfIzoVZ9
 iAMk3uEpp1mfb/IAndA==
X-Proofpoint-GUID: 216LRTwc0kx7ll1aiBq3ak7XvwQg1deW
X-Proofpoint-ORIG-GUID: 216LRTwc0kx7ll1aiBq3ak7XvwQg1deW
X-Authority-Analysis: v=2.4 cv=F9zC5ahN c=1 sm=1 tr=0 ts=6aabb8ab cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=uxpBaPyPSpK-buiB_gcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEzNSBTYWx0ZWRfX4I0TG9phDvhA
 AZeFhuZxyhGVozxNk4WLCxS0LSrLzxFM7qq/HkpKqlTEvczKrAYl1hZDeacZkTkaw4hFgCJQ4Qv
 7SOswmzmMNQgARYLH/6u4lnROcqVxH0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170135

On 9/17/26 11:46 AM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The Pixel 3 features two front-facing Sony IMX355 sensors with
> different focal lengths (standard and wide-angle).
> 
> Sensors are connected via CSIPHY port 1 and 2 and controlled over CCI
> I2C1, using MCLK2 as the clock source.
> 
> This enables support for the dual front camera configuration.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
