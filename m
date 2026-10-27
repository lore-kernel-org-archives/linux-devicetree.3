Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102496;
	b=UeIgOJyfmRKfuASNicPhOTA5fNSWppxV7HuFZtA4af5YttnLzjmw0n3LpX0QjLqs1zQ/
	 D1mx1348prz+EG5yJz7BAc4HW1fbnKIg3a6ou+GccR6OVQmsYXcRpO97zJZPg84h9hhMQ
	 PJDdSD+luAo4i/ExQrEF16NFiOP1YKP9rK/eHgPwRwbfmiQTzUfhh0gzb/Y6dESxia91Y
	 QgqOGTz6/JXhvC/KnoNUNOGhi01ltb+i8gU2mRosPGr7AS5boLl2RSO181yabQ4i36cXp
	 1blyaGH4gY7pqssPx3XB3XOSV3m18sXJaFXZYPtvRcvFa43UfzxKgUYJjcQCEwzIM7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102496;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YeZehaX+Eyc0ulj8eoa2CQrTr2waSodogHrOBiCksTk=;
	b=5lQ5InDOJnuI+1PPj3Kdsav06DNK0t4fCR4NVlhhIdUkr3Vip1YRhcXEe9aKsCX6VXZj
	 urSctFIs6gY8GaXvNpg4W0dyNM/SUk0T6CurCfTzNIF1ZZGXwyQvriUatFYMYxPJPlucA
	 SOaVvYvbndLPfYPo6ERc8fAcWFBiNxZ67gq1sNdLB5gONuMZFR6bcp9x6ZlsBqQyRkEDg
	 PqrT+UFGap8jHPNWtx9UIRanGk0oo3PluNTEx4BuxdNKcfHCEQoQvbSfaK68QMCxixQJu
	 0DRl3Uu2Y3NqYluVrwfw4Zxn4UoXz+MAJISNOT3enSHmfNsS3qvc9wcEkyaVaSvWyqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="AM8/7diD";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fLYEeSds;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D6760A3808
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7D6760A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AM8/7diD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fLYEeSds
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeBEE3026383
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YeZehaX+Eyc0ulj8eoa2CQrTr2waSodogHrOBiCksTk=; b=AM8/7diDpv+9jiJO
	xW+hkOOA3iRMMNC/fCSF/EM4k3qg05txs+BOHZ8DIrXJhOonH+sbV9wzl3p/Pbw7
	jZw0ES6VYhzDmxUPub7vwEIId7FOaL3chc64mEilXT21PaSdZFSICFH4TxFXOhjX
	x2/K3AvasU/NAr75ns4qHvGmg49cHKNYxXBkYjtAWjlJcVmG3KF1A7fK5EdOxaYy
	8GAgBhJTvb+g3eNUNz0Sb++jonQ0mvcPIJcdUYBB4cefdHXIlkUslrignMPzmg76
	LRE/vUi0/+meZzaUE56PJiBSkLgues48LkDO3Gx+9DqRkGl9kCKbvaJdAiBnYwqg
	A0zg9w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh91ab10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:01:34 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cba2460f8fso195184137.3
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 05:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793102494; x=1793707294; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YeZehaX+Eyc0ulj8eoa2CQrTr2waSodogHrOBiCksTk=;
        b=fLYEeSds4cr3GTWSPkRrRa7sIz+2UH/W0BSWn/kKnjkfJEweETIA/P7MjnY+zt7Ror
         PcFK5ps0IGENvLu5lWZSKiqxwkSBs+aj1jsyDKQcd1ds5CxhHPEyyRDx/mqTzxjM4o+V
         ibwY42dt23UMzKdLXPezWRe9TjNOGIGEQzpCDSnX9c4SxrGkfnDk0cnrB847nuDnARuR
         7NiiCw2sK9V0JfAxjnQYcAOAHYBxRuhxlVzvQpI7T2sn4arTgfhSSDvzCNjhVG0FBiHJ
         6N73pRgOqDu51IJtMjk7xTy0epWe03Es90UyJPv1BfRqY2uwSh/XjiIdLGfJN6GsiCgZ
         mjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102494; x=1793707294;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YeZehaX+Eyc0ulj8eoa2CQrTr2waSodogHrOBiCksTk=;
        b=k57R1sNPQZNfhwlOmfpfol40JWGRWs3QAFVLhkKYgg96ueZiA0r2BIkTtHpE1NemYV
         S02myTrYnxiKZFLiQo/ix3G4wDPJxylD2U0X37kofz0WQv6wEblJoJ46sqbd5HfsGvkT
         +qCzoScrEE9cv4ytc2k0ZNxj1pRO5yOjCoqgCVmjrAfSkHOqkX9dSbmExV66g6Phfkp7
         LpYin5RuaNq9H4hgVlFch0QqoC//8gf/apJK/UcBrv8lo+m35swAh+0xmhh0VNhEc8NL
         KHBeLDB23RUzkr/TlkD7OYzkKVYPBdWFQOFx9wfppT0/Gwu6V81t7lkxWCBOtufEZbiQ
         SPFA==
X-Forwarded-Encrypted: i=1; AKwUvBxhCOwMd2hYYjJlJ539rpTPgepzEZFX0j8nV5K1KBuyHreep+fap7D/Hq6Js3BUs41wKR/9/BsYPnf+@vger.kernel.org
X-Gm-Message-State: AFq9FYJKv4MCM5uYIrtFWbXfEo+UYT9YRhzUkXfmJbsLWMAa0AljMLl/
	LwxRS4e42wVeJSE4zdSGCYllKPIBRttc1DaJO0jtj6skXwoaiWoVbLS1i6Rj6blxn2yXNQ7DLv4
	2m6QdAgi0ComC/y4N32WtzZJ/2moAR0FOksqtbl+LTm1Gi3HKZp8WjrhHfXIcfyrR
X-Gm-Gg: AYBFou0mko0hv7FZ16OkJIL/tH0grD4dRRNFHi6R+khNWrQJWlpuOtFWAGbY3SaiQvf
	AB0vqj7eNtdbgYBhtpNpCheS1JNLRtMU1xoWPRFyQQK+115sVm559vrCxgCwrD3pFsWj41wTMYo
	TPjPaP4uwfkC067d65TbkT81t985u9JYtXgqejnqkrdZuN4U+r+mAos5jeI3iGH0SejKmIOnD8x
	GK5U8wjXpT3nzAxsPDyObrZTNsRXhkZT6MmJib1vwnpqAXyIhHfc2U4zWsz9RMzcVbBPcIJKlEU
	bRf+VGKoot7/jL+Dr+agIN18CflcAwfjefIPt7g8fkavqw9zKHk2n+cwP2lWOoOQ9aQlYqIL2RL
	8qr6Xx/mAWTMjDkh86sWGsw==
X-Received: by 2002:a05:6102:8182:20b0:7ca:21e4:8e20 with SMTP id ada2fe7eead31-7ce5cc7fd58mr3306432137.2.1793102493929;
        Tue, 27 Oct 2026 05:01:33 -0700 (PDT)
X-Received: by 2002:a05:6102:8182:20b0:7ca:21e4:8e20 with SMTP id ada2fe7eead31-7ce5cc7fd58mr3306341137.2.1793102493232;
        Tue, 27 Oct 2026 05:01:33 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445990d9bsm4967957a12.30.2026.10.27.05.01.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:01:31 -0700 (PDT)
Message-ID: <803e3f62-d894-403e-95af-3f6765c6796a@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:01:28 +0100
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
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: nord-ride-embedded: Enable
 eDP0-3 display output
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260920091930.2215803-1-shengchao.guo@oss.qualcomm.com>
 <20260920091930.2215803-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260920091930.2215803-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rmxDwFiy8g2teB8aNzLpfwKuFnawf8JW
X-Proofpoint-GUID: rmxDwFiy8g2teB8aNzLpfwKuFnawf8JW
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae0929e cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=N2KePwhmbMOsMYKRcNoA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX4uv+lxS4h7RT
 kKaFB1AtPguuhBLsx3adIoJrFkaPHjIgS2paStMYDV2uexiq352n6iEN27NvVMCaZ3olc95NXG9
 9UW0ZIHhCEcTAVJLQ1GnKA81olCb8paVVJ32KIiNWe5Y/UQhgELSm/RkkocAczl5hNuTpmQdnde
 e0ldjo8+9nGZoPC+CRlTjqp9xjxgOnXuV34Ad8Ovb78BZqFPcWJ0kM57Y8w2kVH8Txs7Y2XPN8i
 RL4Np2VS1H5ac9jpr9f3nYR4iJzbbJS94wgrtR2h013mCUip3nxBiFUc/ZSO8uc7AaFp7R7F8Aq
 O/Rw4FgP8+uB5IrKGdNmvEj6b3LAjCIifSi7P3v1BvPgpbifO7WzfpIvpZNP0+kZ3gDAUZByAdR
 1XPTkGg9zYIG1leuWmdrFV5zslq+fE+vVnSmhCDskH8jEP3qUPMAkhYHge6wqcBmIYfdrqF4yJ2
 qZUXhPAzlFGMRD4xEsA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX6JAHYDAT79sK
 h6HNq7QvAGE8/H1VFlMy57/b0GByYeL92J5bE2ifRpxWi+WyYNNpBV7CyydE3xiQsGDZ1R1jRwN
 7xflpYPW19wz/taDOWVOd3tjs0q2Fgo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270047

On 9/20/26 11:19 AM, Shawn Guo wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Enable both MDSS instances, the four DP controllers and the eDP0-3 PHYs
> on the Nord Ride Embedded board and describe the eDP0-3 connectors,
> their 4 data lanes and supported link frequencies.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

[...]

> +/* eDP0 */
> +&mdss0_dp0_out {

I think these are self-evident by the graph connection below
and by the naming

anyway

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
