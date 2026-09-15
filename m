Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E8E481661
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 13:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478298; cv=none; b=ZvR8Cq4IYDR1EwnCFkMFrf2dUnkW8CIxwdbpRMKFCeY3v8EtuxKlnkRQk/DYrmO2lUmzoqW67Mbsl18Gr/sHbTBEvtnZpXz12C7bXQfkvKnLvVs+KS6wjWAg2iMRTgVvD+30BSdXHQX8qvrpBMnVA56QEzkX1g4WMilVIPckwRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478298; c=relaxed/simple;
	bh=fMMT7KDyQsoYNCmheCV7pMEdLKReWz7gdFZDpKI1mGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hwzm5e85vBLSj2coZv6YOJ4XLuhIbE4M3iQjj3oTddkfTkN1Ft+WP6SW/VJn1NrabEmkJI7y6mOE+iHW4RrBSqDH2cf0TknCGHUf0139VwstVzGifvwMh37/v0bNUqREM6BftYYWHn+95YD6mi9l5O2OauNNlaH/JTfIHsuG6q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OksDAJrh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z8FhoUyu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OksDAJrh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z8FhoUyu"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD0O9t4181268
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 13:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LaXbQxZaYTp04ZjcgnSY3dyQBKVpM6KCTQHDul4VEyI=; b=OksDAJrh7ug1q5t5
	xcJdL08GNas8SYYTIuGuT7iztPVflBn8nCP6xLNqJ4yW9AjA1jJ6W4Z2ykM7mPby
	/b33Nl7dOIhIh3RztKQEPkmYEkM0qzq96ivGjVXFjP5x4dZeoPqvZQCWs6YVKdog
	JfymjtlpDoDKUaEF3vpiqWlnSlHNbI37OaT9WBsQNiAQqDRUAItMKg+eU5xLjoAC
	LPtbrt60R6uby97mA25Wqvz+pMl+nSwucY/s5Jhzf+YG7vAlnEO4gm95z31wU6IQ
	eWFRfZwjC8EoEVR+5B6sxDFERzSt+i6MurqPikoP9frM+LcaNodKNFGgfOzHPIR1
	148WOw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyux1xde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 13:18:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a082c014aso237721485a.0
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 06:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789478293; x=1790083093; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LaXbQxZaYTp04ZjcgnSY3dyQBKVpM6KCTQHDul4VEyI=;
        b=Z8FhoUyuOLGvFXbcHnebjO8Jrefc5K1afkJbXvJsMIWxYu3B4Q1O0RKCPFkEy0KhNc
         0eMbIIMPZm72XIeA6EjQ7q1KkUExGcP/CWovjcSgMtX+C4lnAieAqtFtCAqi/ltjALGy
         aYtb6XC2BdHaP/unB5m9o1CYvGEMxIIKuLJ6Dn5J+rFr9O1S5qZo9wJyDJ3LQSgDUtZu
         nC1JD4j/ve77/WI4Ck8ZRWo4a1VcLXK7QpHat2RaKQv5wnp2WZYPnkNX2NlPfKa/iM3v
         VjxiXYRCe6rNBFH/HZahiP/5p9mSV7Z4zH2yFvfLOeFSC+N4zYP5Gc9QW8ntxCXQCkig
         XgIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478293; x=1790083093;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LaXbQxZaYTp04ZjcgnSY3dyQBKVpM6KCTQHDul4VEyI=;
        b=UXvAp5pye3rnor/nkmkfulcCHoPcVl+x2CCWnMzRMUz88itYdEBtoIsYjkO0vXjnp7
         XotUnPJ2xhs8Guoz5cwyCGNowwJEYmADoYEep6xAO8RmCawvoEwQ4+Tv9ORbTp2WMzFt
         lev2ffTj2JmGqK/4bOD8c8viBRj6aI0P/ZaVipjAl5jmhYGixR8eGVwZgHISU/PdcJDH
         jXrk5GDMyY159gOhMhgBwT/mp61SRxP6hsfZoyJ13gCfcI6SlABwhwRcxVfOT8wVsos8
         Ii8NpirLjttvATSeaiMKEdDMzHZtrNy8X6zwYfndmM0JZZ2gWZV/tSGi8YTsYEF3b2N/
         q9Ig==
X-Forwarded-Encrypted: i=1; AKwUvBzl/5R1mNOlN6tsDhPgyGIC4Pby5iC7grxNOubeYKr/ekCiWQykf0VyAx9kLskfUNA5BKm8TF4ulKg/@vger.kernel.org
X-Gm-Message-State: AFuF++mz5lokzs81PsaS6tjSIhuTXSZTlXaivAN4Q3IkU7PlhhWWpTcc
	4HLmkGkcm2Jgk2jcqUXaN9zpISAF/WNWalXxZBpsFTqopq3KNRzv5VGwQdJ8toXB1cx78qleyxS
	FXwhPRdoj4EJES10lRgCs7wRsx/O1eDKgOk2nSQDBya4xIJU05jmpmH99YSJibIst
X-Gm-Gg: AYBFou3DtSld1U877PF0DgDolOmi4FLUoz1jdjnQUBz2PsN0EwGMxi8/ictLHujg2av
	OHMDff77LFgQg1TNr9gjZ9+zEDr2uT2mAE4zTJ/yele6kerwryO8JveZG6SFWcIHIfwVnOIepRJ
	SK7JkPDlrjaHKvLGDE9pfCxFKXb/5ynS5DRg52FlDWOaPaUoCL+nyORbMp58/UMG4XeqBR7nGJz
	KJVhRTcAW+AFEe+ZM+5YmI8bUrJ3LvTSPY3AUixdMpi1maUjF775oIEQBzIgYzT3iB+4sLkhQkY
	PWCZtPOPQrQeAD44JOY20tk/rKZKxL2S8tXsdRN98DnnYjhgPBdiQV36U0lqMz16jSxktKS0pHL
	D/169sJlKDbHXYP3oXOShrqtZO58=
X-Received: by 2002:a05:620a:7018:b0:93a:3257:34b with SMTP id af79cd13be357-93a346fa956mr478721485a.29.1789478293291;
        Tue, 15 Sep 2026 06:18:13 -0700 (PDT)
X-Received: by 2002:a05:620a:7018:b0:93a:3257:34b with SMTP id af79cd13be357-93a346fa956mr478716285a.29.1789478292807;
        Tue, 15 Sep 2026 06:18:12 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c2966067117sm597020266b.33.2026.09.15.06.18.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 06:18:11 -0700 (PDT)
Message-ID: <bef1437d-6ff3-436e-bd18-2a430fbb355e@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 14:18:11 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soundwire: qcom: add multi-master support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, robh@kernel.org,
        vkoul@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, prasad.kumpatla@oss.qualcomm.com,
        jingyi.wang@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
        quic_srivasam@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <cover.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
 <0097b59e2b96d692b9fb542e207ee43f9dd44a7f.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
 <8c6bfa54-83a7-4d37-bbc8-d3384dfc6ce2@linux.dev>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <8c6bfa54-83a7-4d37-bbc8-d3384dfc6ce2@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE5MiBTYWx0ZWRfXzmo3yZ7b3Zvr
 hnVefFALHpYkv/JTzSV9aCGLRmPzd35nyGqhxwwdBjd/KaqpIzJpTJh/VZ8LO3gT7Jp10flh7AL
 ghGb+LOSo6ZLI5HFBEEA0VN1yfevXFiTQ1wfzTxeUjxUm07MNSy/npBFH6M/4ee8lU2vakf2qJX
 /YVvMSfazbY1qaW4slG0YeCfB85qK7iyPXOuYx45yhg3LXxQpfaPUuEeugcGlsw/hQLBUIJ2+Om
 TE8HFabdsqvzCqpHeNPROWhttFvYASJGh+P/gcphoCq8lm5Tos20oZB9BIEGcH2wtkPsNL0bxUO
 FPnp0wysv9EQ2+4noUN3DLJQW1TtG04ZjAOOQTFXK3uVrwri5DhlTn9IYI8Evlaq51rCXbW2zPS
 gon8SOvFvQs6/m7NRYBEKDgG8De3cy8G1fcEMzD59s1hEMIUEFvzEyMnCVEHJArGTO6BYk4dDtH
 gKIbht8stNiLXpK0Omw==
X-Proofpoint-ORIG-GUID: E6FtVJrxyNwketpneKoP6GwsYEcRoNHz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE5MiBTYWx0ZWRfX8s6YQlNuQiVh
 2BIyo4nluz/BBFWSmEcpJfp7ObXMiDMYVYVpWbH/MRgFPRT2zA4Hdyy/JQPCHXaXHcRg0QlSX5r
 l02YslNiLzmG1QTD9vioEUWVOf1WdTw=
X-Proofpoint-GUID: E6FtVJrxyNwketpneKoP6GwsYEcRoNHz
X-Authority-Analysis: v=2.4 cv=QYLzLcbv c=1 sm=1 tr=0 ts=6aa94596 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Oxe59_bkntSI8SC7MgYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150192

On 9/14/26 6:21 PM, Pierre-Louis Bossart wrote:
> On 9/11/26 10:21, Srinivas Kandagatla wrote:
>> v3.1.0+ Qualcomm SoundWire IPs can be paired to expose one logical
>> bus with more than two DATA lanes. One IP owns SWR_CLK and drives
>> the bus; the other contributes DATA lanes only.
>>
>> Support this pairing on the driver side. A device link between the
>> two IPs enforces correct unbind ordering and keeps the peer resumed
>> while the primary is active.
>>
>> Single-master deployments (no qcom,multi-master-mode in DT) are
>> unaffected.
> 
> It'd be good to clarify how the command protocol is handled. Each IP is
> probably capable of handling PING/READ/WRITE commands in Column0, but in
> the paired option the primary IP is the only one that deals with Column0
> and all other DATA lanes are just data?
All the control/command is only handled by Primary controller, dependent
controllers only contribute to additional data lines.

only Primary handles slave register reads/writes.

I will clarify this in next version.

thanks,
Srini
> 

