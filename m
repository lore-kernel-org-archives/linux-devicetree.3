Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D791536167B
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787563321; cv=none; b=K82QBxeIdqPFL6xA43/ToSKY5TmqNZQiKWfkkcjNzwH3ivandu4+zXXUzGs7icKNnHyxTlanjl6l4wJ7zpYgkvNwYQUyq6Q1KYx14ykjfrstsYT5r2xL2P3LFZtgsRKq6QQOW8NIlVnZIEC6EdHNsUMaCxEmmkjSbg6iqbagUjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787563321; c=relaxed/simple;
	bh=o+B5RSigbPl6LxyEugiHKw2RVa3xzMwCkq2ly9Aebn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=utpArfax5nfFcgy4iPrYz8ny9PqSca1aGO1M5ASMWxve/TGsHECkFcFot9jSmAA4S4EY6pFRSQrrAVKnVY/yX6YcyGQ9kKBswxQJEPaIVOUgOL84hJYC6yB4TFRC8tm7AZ1xN0YZbk+PYqzD3Lxjk3VixQnUQuS+NYRqmXU0p6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LYmVziRf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YP5Vir4q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LYmVziRf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YP5Vir4q"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O99ALr2448696
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8dKzfaRi2Etz6Z4YX7fYfgcARzGLYR+vSE6GioyE3ec=; b=LYmVziRfEr/jQn7E
	qFVJkSqeksiAUxzSg9Ih+axo/QJSAXro5kF3a8fSvuhTxSIbHCSeeTnlYmJpDqsq
	y0/pbhNxfKtBtIjuSgq9wTkkCm4/8y/5gfKWmAPAAuOmkJfYtFDwBkb1FpcNL6+r
	LP/LO5SgQW+TvxaoyUhQTHAPJh9jsqeWEryIGKu+Fjffb2WCZDDZK4rGBRjaFO8q
	i8He63TnznwN6+U9s467caSEGxA94kt/h7ouJRqhB6aQINWfFsxB+lmm/PpMi6NV
	rEdD+PRLX6dZ+va9KEiTeUWi3/aaTmyFySEiOLvmPuwzNMjh120an28pcBJ1Zrg/
	/wvsog==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8j7r0cjr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:21:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfd1772d8so7361371cf.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 02:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787563316; x=1788168116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8dKzfaRi2Etz6Z4YX7fYfgcARzGLYR+vSE6GioyE3ec=;
        b=YP5Vir4quu7yv4UoT6wiOk7rhO2Yv1G+4Iw9e+uigq8xJ/+LS5zDJVxCaLiJcSWthM
         HAQf4Utqp90mfygUfdkVBgqon2/AS66nHu1O8cHCrpBtT5X9y0pdTOu8AbYh0N0AibZt
         vEcaKq70IvQbwA914lFPIUbWOJhiudrW/JHdLKWmj+i+BC6PAlfRlW1J8gWGJTk9dHww
         ldcl6E0HWxjTrwpbQwv8CjwdNbNxwcsYt2ubzYzvRssgnWwBGAMCh1rMr7t0/B9Cbalk
         ZyAgBF8JqTFf080cistDUq4QtHzJpQYr7MiO8GNLt3/cWDkckAqVPFzFcw0I0EEtV/Y3
         rOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787563316; x=1788168116;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8dKzfaRi2Etz6Z4YX7fYfgcARzGLYR+vSE6GioyE3ec=;
        b=cA9LMecl8StiZ4xG1CLeRudT0kg0vobTYjxWs2O91vn4+puyfkJ+hGY2qd0CQQHZfl
         /RsqPeBtSh/tUNd1s1N0oyy+Un0GQ51YdYkwesDKl5iJUwDJtCHo3YqTLfoeudT2gZSo
         zvtSzvwZTQ5ui3brBJrWpERJIUG0Rh6ZC5Bikf7t/Obzb9WFMyivqzGPLpLb5qi/C1V/
         Rh9OpGsDMlZXOmHAVWcQ5urBWPOr3fAcCEWECoSbOkIdVcbING0hhYneBeW8Qk8LBtfl
         Q54flhWirnyDQzIGF00qQwVXgcVXDH7XbdCRyY4wGQ6GiBVNidITBMkLXCeys71JNR5S
         5THQ==
X-Forwarded-Encrypted: i=1; AHgh+RrvGwYdGBDAZ4g8uI0oUhUG2J3uTFAsxoBJlMgnhf6cYDMWXXl7GiJaSXWXcoNMRCu5LQzv38mGZeth@vger.kernel.org
X-Gm-Message-State: AFuF++kx2hkaAmnjJrWqMfCkquWqpSYseQUSYX7RdTrVr0OMcGxJGOY7
	7LcvLPi7yyUHOGHsF2w1c7DzdcXrhU/Y7Wu8AnnQXqmyQWztHvOKEkzlVhq+NZiNjhlzvAgYPyC
	+k8x8wTdxzP0kvR1YJ1dMYK7PDvtq93jblGtCpEKvnVytnSt+PFwplD3LPsRXKh9O
X-Gm-Gg: AR+sD11nXkWERSIJwcrkzk4t5t+n8wkgl0QAMXKyUWNBnA0yiYeOjzmSlTnjNLO2QRc
	zY/9mwXDVI9XgRBDLk5lpfb/F0JjDSBRRoB//zxnnrkySUCgo3K3jeCV4k0wu5WLHUIyJ8BwP/F
	8e59dOFMWzkWiveyIcAsYaqYUgkdDupEHI5RHgcCHivgdwQVNA01LMYlCzl3mrPNHeMfc9UbTNc
	qP41C0pNDJJ1xjYgvSFNQ6XzganMGcCg1nrq9M/1SqR5p8KNOPTUUziLMMacVUgOiuWaxnQs9oc
	U7S+fz0qa/QT9GGTWHUH26N2eSgN2YDW1dUj7bJzmhETWTKBfU6qmUirGOhtzBSP2/szt65SH+W
	QT1gDc9t+ilxEBXCrXc3kajqn
X-Received: by 2002:ac8:5e53:0:b0:51a:8079:795e with SMTP id d75a77b69052e-52df59d1d7cmr182458701cf.4.1787563315605;
        Mon, 24 Aug 2026 02:21:55 -0700 (PDT)
X-Received: by 2002:ac8:5e53:0:b0:51a:8079:795e with SMTP id d75a77b69052e-52df59d1d7cmr182458611cf.4.1787563315279;
        Mon, 24 Aug 2026 02:21:55 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2495ee5295sm1200185566b.0.2026.08.24.02.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:21:54 -0700 (PDT)
Message-ID: <7d78ea3c-3de3-4f90-8964-18a962218fca@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:21:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/2] Enable sdhc inline crypto engine for kodiak and
 monaco
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
References: <20260707-ice_emmc_support-v9-0-701c86f3c25b@oss.qualcomm.com>
 <f5b538dd-b350-4eb3-a300-78a02d5e4f1e@oss.qualcomm.com>
 <d4c65f68-900e-4d1d-9b31-350d7a88343f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d4c65f68-900e-4d1d-9b31-350d7a88343f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA4MiBTYWx0ZWRfX3xtDuOzMD96J
 LFMIF0fpWNwIsKe6ppPUuOlPuFyWiBeA+UqzNRg5CkogubxYh5ZNOnm7UtIohHCS2YnmN5rmr/V
 NVNMtTl1SOc9WoMYebIJ4OVQhtPSze0/EuHsgrqAOT40ASth3dR6Pf/dNQ3/7rGlMIj3W8jUFZp
 tqW07mxOGaYz426VNvzCzBGwbyqClNeEsutPnpn++Z22A1Vmgw3Jui8aFr7IfSaIZZTjKjaTem8
 YqtgKbKSXDRmQk5Z4WJxSweUv7MYjrI07orEyEwT9g8qNQj9oMJyjeIl6nglgrMkpIU4AiYEB+X
 p+EKb/opRvXKzUPiLoxNAHVVGTa5yn2L20y9ggz8+lMMV2CiqgNTej2DuDduJx1uEWXJf0ifg7P
 h9lQG4AYQ2e+8v0rW+SoW5soS2EW+7O4Fke9d24nx6YlarWAkrbbZt+8tNpYlJpTgWCtODWS4yf
 32wKmqpo46w33Cvi/Lw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA4MiBTYWx0ZWRfXyxcgDjJdsk5S
 WWdZB5BYGFe8U9idGWWqp15XaUeTqQdVWT5PJa1vo0QkM+RWsq4DbeUPYDsxbNKQ46PyapD4gmp
 eaEXK6VoHgJP8QLbWmE9s/gT50ujnVs=
X-Proofpoint-GUID: FzJV62lmftMHQUtIZEXbqY7QttDnJw7L
X-Authority-Analysis: v=2.4 cv=IL8yzAvG c=1 sm=1 tr=0 ts=6a8c0d34 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_4JtDfczSMH1pd5P-UgA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: FzJV62lmftMHQUtIZEXbqY7QttDnJw7L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240082

On 8/24/26 10:43 AM, Kuldeep Singh wrote:
> On 21-07-2026 12:43, Kuldeep Singh wrote:
>> On 07-07-2026 12:41, Kuldeep Singh wrote:
>>> The series is combination of below 2 series sent in past. Since, both
>>> need to be picked together, combine them and send as one series.
>>> - https://lore.kernel.org/lkml/20260608041650.541502-1-neeraj.soni@oss.qualcomm.com/
>>> - https://lore.kernel.org/linux-arm-msm/20260409-ice_emmc_clock_addition-v2-0-90bbcc057361@oss.qualcomm.com/
>>>
>>> Document and wire the SDHCI to ICE relationship on Qualcomm platforms
>>> where ICE is modelled as a dedicated DT node.
>>>
>>> This series:
>>> - adds the qcom,ice phandle to the SDHCI binding and enforces the
>>>   qcom,ice vs embedded-reg modelling rule,
>>> - enables ICE for kodiak and monaco by wiring SDHC to the dedicated ICE
>>>   node,
>>> - adds interface clock and power-domain requirements for the ICE node in
>>>   affected DTS files.
>>
>> Konrad/Bjorn, could you please review and let me know for any comments.
> Thanks Konrad for review.
> Bjorn, can you please help in picking patch for v7.3-rc1.

I'm afraid you're unfamiliar with the release process and have
mismatched expectations. The feature development of 7.3 on
maintainer trees is done already and the RCs will only pull in
fixes to the new code.

After v7.3-rc1 is released (and we expect that to happen next
Sunday), for-next branches will be created atop it and maintainers
will be able to accept patches targetting v7.4

Konrad
