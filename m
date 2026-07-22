Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5F6476CFB
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784711513; cv=none; b=DfP1LkjEeQQPyDb3eLoz3FsJuCQmRbhudbuI1aKEt57aIs7X2ffYQk68Xi91Ury7P1cJ0eYcvy6wIF2c/4ZGvzkonW2tZCBeFSKXp1RW0wQyNJCBguFWAVXhGkehJAGjhEcMu0Dxj6bZc+AuEDDOJVW+3y4QExkQSPAlQAq4Sfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784711513; c=relaxed/simple;
	bh=IWHBXYLysnyStiHxRYu7KPLO099oW2ylr2y+fkvh8EM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LgL2gJgo+/EDrQWSLtUvgLkgUeQf7pwTHH8FZdu2dyvFu5PUyMlMtX46ljrDBUjjUqkAGAhcLVvbv8IENnuu2h79fo6nO9bFxUt7CgJxPnEpV0NaMY7cJMbxw4RW///omsEcr3lMVnzGRQh102NriQIhSSZXj9s38TGBF3a84SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pgZyT81Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iJGr+80k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pgZyT81Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iJGr+80k"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xJvI4018332
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8DTynYoEkJaL/tiK2wP9WPgWRD28pAfrWecZZ4NWTdo=; b=pgZyT81Qv/peC72d
	h9M49H8pW3jOyHXeUVKrwDSekf6vxdbhIm6ndl4uEWWEojip5d4seUP7o63nXpek
	qsL9UPc2/Zl5dPcm6yYF68IzVUghL0Wt7LMWIhqYqdpw2/ulpkdsm4zFiWQFE4XT
	j56yS14iIesuWwIVlBs8G66eey3VyG2THvJ0QudZ1vzeizudMDykA0PH02NTiGDs
	0mVgYipoThnBaYdpJ1gjEcA1C9R216dqMa9+GEsx08xc870urBiM/idDohEkNgM5
	wxWBmMn5h8pNpGxQ+wyNjSHCRSHuLe5rUluU4KblKqjFeQhgVVR+W3MJJwA8ZA2q
	bpNhkw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6fu95y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:11:49 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb5cc1e139bso3169391a12.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 02:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784711509; x=1785316309; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8DTynYoEkJaL/tiK2wP9WPgWRD28pAfrWecZZ4NWTdo=;
        b=iJGr+80kJa23YEE/XEHP8eYX/rIs3o96QpLps9cnOI86os0U4kIYBIG8Ao3Yf7fAhS
         CeaKe6G4n1Q1A/PKsN5JrRw5kwJNeR+rYRDXjzwxH65DBgIZ/DAI/4MqWo9wXLaWab4e
         w4LUmMcR/0IK+Hbq4rOaPwqVmvlXaJHVEBWCzY7TxITrpWSR0ZosyrssuP9xM+7LPh64
         UcETPGQ8NGJazFfQRgZpqb7perCNUBwcVkTs5eXo+P3dChq0t8krzDEr+MSOCgIqqAH+
         HZ+4RtgzqZ9h4iaUR7OhD3OMAy1zVVUCOCJjx6ng/vUdjS6+AOGoF6cOPJcwtdYQC7Z1
         98zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784711509; x=1785316309;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8DTynYoEkJaL/tiK2wP9WPgWRD28pAfrWecZZ4NWTdo=;
        b=W8lFKo4npUIBKsXPkCFOm+JSIsABhXPQqULwAGjvtVUzbLJCiYaiKeMQIqOtgJ8ica
         S73fnBNzCBOl/JbM+Zs4sE/qsXa/yEgNwO+KCfjrl+iVYWw4qQwANhPZb2cQFEElByH7
         7WVKKWy62ZwS7XtRstI2JBKJm9DpPsrdWJ6Oo+7pHDLe2cUwfUjuv7YK4Db34OqB7zYF
         Lbi9yjl0llEi5xf7394hGaHkwVDEj/bB0xqTqHsbcf6+Bv8EpItN5seZv0bsu0fqf9XU
         cCK8YSauegisNZRJAcARoDofKgPC3NS71H/lpWXV46IICxu3bATADBX+UbbtKSI+vhvj
         GBQA==
X-Forwarded-Encrypted: i=1; AHgh+Ropjk3pNpMlROOcQAoxm5h1RgI4ckVV4huT02unEO1w6JI5lFgsf6ZYKc5kbSfQQae6AEPfagqL5GXU@vger.kernel.org
X-Gm-Message-State: AOJu0YwRIADaODPZ2infBGexxDgl0lL+ivDthhIz1+ZMuhgKjCfoe3Fa
	ijR4VM82WLFHB2upssT/f3snluE2YZbOwq6zTJTs7OnnfQ3SPXq+ASXEyOhg8etJMFvy4bI+yUC
	eX8upPo7vTd1HvQqw4i8KtaxOw2cOLNRI2DPjEsG99mddzJqImY9YjkcmkaPS/wGE
X-Gm-Gg: AR+sD13uQuNV9WA7qn2N5Yn4mX8ZG0tV0AipdW5w7EYN4ydOZSBkT851aNjVk22nYm5
	EjFBkoST35/YR6rx82tprXDGbF9F4ZyrIgP5SwR+TzhWKgI2llY3VVdCTS5jDASNKL4XLiQus3j
	bcAHtP1NTFwvxdYKxkX7fMJrxB342EtCfnvyEH45eaHgFqt7TiiSkqBltSbveEr8vLl7cp8U2da
	TB4CgDPZ2Ufebob1uav7hmHwDXVLD5Ps8beUPTtpWc/W5sF5FDJ2QPAY6dcpFEqs4EfYBHnt/2r
	PI/1pzSpScqtBOzqSu47hSt5Mq/Tq9gd/4ffu4YNHxgWyhuONifgdmz+tQQxlHwc/ICb6HPH8Ey
	IOP3hNS5TdxgpYy3qtAJ8ZDztfEo=
X-Received: by 2002:a05:6a21:828c:b0:3c3:7e9c:e292 with SMTP id adf61e73a8af0-3c3ad7ac45dmr22496142637.25.1784711508855;
        Wed, 22 Jul 2026 02:11:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:828c:b0:3c3:7e9c:e292 with SMTP id adf61e73a8af0-3c3ad7ac45dmr22496103637.25.1784711508356;
        Wed, 22 Jul 2026 02:11:48 -0700 (PDT)
Received: from [10.233.16.34] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f18ba96sm798387a12.17.2026.07.22.02.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 02:11:48 -0700 (PDT)
Message-ID: <d91877e0-3b41-45c8-a9a6-6ef8456c3c13@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 17:11:42 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 4/8] phy: qcom-mipi-csi2: Parametrise the common
 status register offset
To: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
 <20260720-kaanapali-camss-v15-4-c0b1c1167c5d@oss.qualcomm.com>
 <ZjDt97YCI6QX2gXf-F4lYaIj4po25RZtKf27ElBUOzGcXoPUf6mR9uSVb16GcrHYpJdCJg5Ee0IX6oJvQx1gFg==@protonmail.internalid>
 <2512aab8-fbde-4b95-8619-6c32d60ab500@oss.qualcomm.com>
 <f5b9bf18-1bb9-48fd-8168-b5b82cac08db@kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <f5b9bf18-1bb9-48fd-8168-b5b82cac08db@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: T6TGdang5HGiaPGc3uE2ESQoAvXC0uYY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA4NyBTYWx0ZWRfXwQqT0S45qybB
 lY4RIm10LlX6xKB6Ka9mfBjWCEBCArVTn3HLm1yVVyI7taBhTxOv+T3VmsT+I39DfbWTMBy4Uw6
 pdnvjPyJcOqA6HFtldM+kFheEfNu/ITUl5+wtGNfVKf/AK4Rqi14DvepCfWeQBm7LNso9fw9+FR
 wZQfinlU5JSIQK+rJhDZH6LRja3R5CvlcIND5vpobilFFqxLFKbmfBFcZzfOJX2y485WqreKoFI
 RrsQ6ukYnS8+wvw4prkMkUTWTBHKFXiLQqcQAzPGVl8s+PYnDZXKifkiTex1mPbDd50CdQxF8u7
 Vrt3k+eWHMEpHxP67pfNylQKkel3PzYSQkixjQLtF/2fXXfh4JAl3ieef40CMZe07tlWPe8yOU3
 4h0MApFKHeVJtSYMSAP8M39TqfE2xSn7Wz9vqHKyhYKdm/5wyBnOwbBOhLTDpOdZQqwmonAdyEq
 s4CJEVgmtvtqYpGWKuQ==
X-Authority-Analysis: v=2.4 cv=e/o2j6p/ c=1 sm=1 tr=0 ts=6a608955 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bKUu_ElxWFkW26IasOMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: T6TGdang5HGiaPGc3uE2ESQoAvXC0uYY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA4NyBTYWx0ZWRfX7rEm8kiMW43X
 3pddsVrqAbxF7IIposXSxalaEoOA3HcV/hlhQOTgHRNiFNF3uLPHZFsua3PmO8o5CDcsC/v3w1A
 mX6QFqO/rs+IQXJxCDvxFGIOc8+H8G4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220087

On 7/22/2026 4:07 PM, Bryan O'Donoghue wrote:
> On 22/07/2026 03:24, Hangxiang Ma wrote:
>> Hi Bryan, could you try to add this change into your PHY driver? This
>> macro format has existed in old arch. We once have such discussion on v5
>> thread.
>>
>> https://lore.kernel.org/all/bc6abd24- 
>> d56a-4fc0-89e9-8986e8d8b3b7@oss.qualcomm.com/
> 
> I'd be obliged if you could generate a patch I can include and mark you 
> as Co-Developed-by !?
> 
> ---
> bod

Sure. I think it makes sense to pick up this patch from the series 
directly now, especially since I need to post another revision anyway. I 
don’t have any concerns with that. If you have better way to handle 
this, please share your thought. Thanks a lot.

Best regards,
Hangxiang
