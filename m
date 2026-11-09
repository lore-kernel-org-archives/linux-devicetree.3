Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794190122;
	b=Fb/tPqhhcwIrKeoIkn2GmBUrHt5ZYLEopcL5Jvx4WuwG9XlfpK+fbXx6bp93qdkglyix
	 HXGjXrYSUedDO1hrCBEG80S15Uh4fIS/pndLVC6iR0+f/XJbSbHwxJfAl/pzer34zBFug
	 4x3bRUcDKUFxEtaAi/Mcewopkw55roMJLtQ4FprXs/YfYnEY5CYHFDRSI84g+APp8oT50
	 pBQYcjVcevPWAyuzwj/8B5AR7B/6evi/xumyxNf59CY7TvwabG2U7rPkSEsNZtXR422wz
	 ugkplNbLQ0zKoSsa28peUQOOTSHcOFRdGi3dUgsIKDj6HZn5+nI4IEiSQrBUM+18Hsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794190122;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gIsILu38RSpIB/VQtAXT+jlGCK+QgBbfByzV7rqh7Do=;
	b=nFOE+LW9HuhgXkTLn52v90iA7SLl0MNXPZde3T9c3Vxj1i5ib+NQ0Piq3HY5ynVi3JeG
	 6L/OW/bp36ZyTGGrX2FIYtb7Ajf3JLgVH22ynLo2skjUbdMb/DToHHrkWQS/MjnGyJ1wg
	 eufdelCoL13QzMSSWpeUEMdS1Bxv6yQuJwM3xiHS5emBiK6okAvX/xoM2s+vso85oHxp2
	 F8HWxY+FlWTpxvk/ru4wZmy9XpkZ8PAgBlnn43BguGLlwj9bzp+sHT0EeaZy88gSNjlkC
	 8KSFNy56vg/7fL2GtDGMGAKxyaLSdq5ZF7QsJ2ZCx2as2LrPhXE2++2J0wZuEvdz3Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PV4VxcvZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kVKYN+Wy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F50606A321
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 02:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2F50606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PV4VxcvZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kVKYN+Wy
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A90Gt553926346
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 02:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gIsILu38RSpIB/VQtAXT+jlGCK+QgBbfByzV7rqh7Do=; b=PV4VxcvZEc/NHdbF
	Oe6LhKn5icnqW5+Pd29eXIRMoHDKJgo7vqPhqzCjBKoamE1IyHesxWtw8WJUy4A7
	nZj0prCqfgPFPYjAqVJ6n+xedd9+mcLSUMNV4r3kBHJB6X4d62lKmLufjT/yU5X4
	E9ITpZu7Cbrle+Cb4OQ79RGZWppKr3/1mEu1YTjiXNhAaqSyReX+uvnbyrhXyNxZ
	XO965UFxP+TVR1AuYo/LaWFzh70zJxUDmEXSYJhD1uX4xfEcSPgGnPcNOMSa66To
	M1R1ED9Eo5NJjhQ1hu8aZHYF3/5+Ghw4ERO4WDr4nTxUHFLdQt3352KUDeT2+Njc
	/KuFVw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hstxscd7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 02:08:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0ac277beaso362948a91.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 18:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794190121; x=1794794921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gIsILu38RSpIB/VQtAXT+jlGCK+QgBbfByzV7rqh7Do=;
        b=kVKYN+WyJLt1G/VwfC3wzIjvEY0+jPA65TKXFbj3X0C8Em9Te/8jt7vH3AtCzgX8Hn
         S6n3+VvY4ky0aQSKx1qeLAtf11HgTsVxhS7LJXgqO+pY7H47YpAMM2JEgbWXWW3JJMHP
         zAcu0u/42NE9BtQkxiAEV7++wtHbiwRqnYzCb2MJRsDdNuM7D8McYyYt17V0eXHOF/tu
         JcVYhYhAUVoETZzUJ7PrImU+GIn3BtFTiaIWzbTyMB//oKbPv4cuyBIh2jAEpAK3xYSq
         9a0+hWGzyDZY4fBHkXSxbU62hffUqlwfG7TSGLZEl7y4PN2xKGC8GsruI5KP9aQYkiUT
         FPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794190121; x=1794794921;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gIsILu38RSpIB/VQtAXT+jlGCK+QgBbfByzV7rqh7Do=;
        b=uEu8OPAF8XQjUKIlXy89x96YeZ52tYkBU7iaJpaFeUwViv0caf+FdHX81GLvCrRsWH
         AI38nzO9BjuIAI84abRNifOTzWH+86/VpKwsVW2TiWHGwXEwFCO5K6H7Xy5TlVEttS9z
         gctZRN4my8OcxVCSVCPTyWm4TZy4EyE6OGngLnFk0l3O0leOb739PeaLIhigS3XvIrgw
         0ScMRn83pV7a/UQ7IE3bsYNa+7JERWKKCp8GqM+qou1kAxfSJ+ZQSSSZ77qDyB9bRti5
         W5/CJpywaEOjytEfE1wNVTr+953Rre/6HyfHG9HrwOIu2UtzBWLJJswpzaddGCY/T+Ju
         AaZw==
X-Forwarded-Encrypted: i=1; AL+hErHcRtIZMYFXJibo5ssvokcVL2Xsv9kqbpVMNfrJgeAOQqrrKtpmemkppJmtAnnyU0B6BiwXeiwDFKlT@vger.kernel.org
X-Gm-Message-State: APuU4Z+e6mqkKo3FoLAdbsYL2tU7nI/CRa+q1wMczf/l5qVEbn+K6Q4N
	2YDZIKdhoz5tpDDYAOJBX6S2UdmTYOnLcPabpNBLYEI5hG11UP9RvD0D4pY6CXKnKaGUJTLZ8UJ
	xy9hckY3ITT46zVrL5tXdqzeovCzgenFpl2gU/NAcLrhVCsZ7t0q99VBTYeZeCwyP
X-Gm-Gg: AYBFou2aqtOI/9b7qezp/uOjdB7JDvrLrH2/KPjo2RspD6cCpWVJizGcChPDO1TQAjI
	UGvBYqBG6o7cLlzEBIiwiFhC5T48AiXceMpXeqZ4FqdpczxngrxQj6yAboUaljCOGQa0qY0MMe4
	aDw6oDvBtyvVdvRsRBvv4Qr2DzodR44758JgRflRM+wKYcbRL0VMKIkbtMesBzBtGhjhqbSAtUu
	6XkquccDI2aFx2GbQBSRZ8/quEBM+2y0pAbh1i9FtU3OSECYp+36awUqzlerjsto7K3ukiVzS2u
	MJaVfUCO5xpECbzy8rJxTo6Z2tfATPiZ+DmJ0H+aElkdXqJ6eCgQTuEekQtu7vJY6YAO+9gzV1w
	O8gWqjE1bTGXVT6O1PVDJDhuSd/IWg5h/E8BMVkpSNQ8ldhL2VWfVfQ8Jp4f5aM0Yc7HT5aiZ1h
	LTJhdE8C0A7NjmX7zt09iH32ptLEAG/WIST2fJ/1T30p0B
X-Received: by 2002:a17:90b:4c84:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3b12d373624mr2158728a91.34.1794190120355;
        Sun, 08 Nov 2026 18:08:40 -0800 (PST)
X-Received: by 2002:a17:90b:4c84:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3b12d373624mr2158678a91.34.1794190119715;
        Sun, 08 Nov 2026 18:08:39 -0800 (PST)
Received: from [10.133.33.170] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1278918f4sm4779025a91.6.2026.11.08.18.08.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 18:08:38 -0800 (PST)
Message-ID: <5df6771c-a440-45cb-bdb9-ca25b42287fa@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:08:35 +0800
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
Subject: Re: [PATCH v1] driver core: Demote "Fixed dependency cycle(s)"
 message to debug level
To: Johan Hovold <johan@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        songchai@qti.qualcomm.com, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, Saravana Kannan <saravanak@kernel.org>
References: <20261106084034.1579494-1-songwei.chai@oss.qualcomm.com>
 <au2UzljzfMaiL7F6@hovoldconsulting.com>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <au2UzljzfMaiL7F6@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HtgZWdIS-FrKNNqSkFUGwQ2r88sg3YdQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwOCBTYWx0ZWRfX+i1MQe2y6ukg
 mjIpabYnK1F9uru21vM9J7rWsEx9su48xuTXcmnT+P6b2MXi0LIpLPy9jD8hw8tLej8qZj+T6Hx
 buVNhoiZEoq9nv1EBKZhj+dzUwdhSOs=
X-Authority-Analysis: v=2.4 cv=dZMVTnXe c=1 sm=1 tr=0 ts=6af12b29 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=wpr1R3xn-rj-rwNLJSoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=xwnAI6pc5liRhupp6brZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwOCBTYWx0ZWRfX0Zilb9VrkXO1
 hfjC052znS5fLk7b4cgQfH4je6vMNs1RAoVdwRXUGSvmD3gJQhUiNrZY+wYD4IX+PXjRi00qBAa
 Os2VAI5pk8hW0IzK8JF+nA1QSfDx+UO82ncc7YyIa2MjQrfs/HrbETQ4w/agjEPW/Cny3P29WLq
 BL5oHrFefacgZPROjLMLaZd4jF3XrpkMgY1QsT9sTLT/yeM2qEir4YkmjmBMF0HKWBF05bodIFU
 MM7JEloT87zAuY5aQhiDeNBts41o3l/Ha6J3thl1AHPAT5OaS3zGYxHFM3gIhhaDzcbwvO/GDHw
 FFiWSN4RTI42jRJVTg7Jy/RvdWQxE5+JiV/eyi9ET783atMbr5TyB2FSVaNLg4QFdSHwbK3oQZp
 oyJu2YRc++ATE5FHrFCmpSoUan9oNRyYGGeK3ckvfyqvwitpwVGOS4QXKa3VvVOY0Pm98cKIbzr
 kkdFxGYanjHcTkXvrog==
X-Proofpoint-GUID: HtgZWdIS-FrKNNqSkFUGwQ2r88sg3YdQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090008


On 11/6/2026 4:50 PM, Johan Hovold wrote:
> [ +CC: Saravana ]
>
> On Fri, Nov 06, 2026 at 04:40:34PM +0800, Songwei Chai wrote:
>> fw_devlink detects and relaxes dependency cycles automatically, so this
>> is not an error condition requiring user action. On complex DT
>> topologies (e.g. CoreSight), this message can fire for many node
>> pairs and adds noise to the boot log, even though it's primarily
>> useful for debugging. Switch pr_info() to pr_debug() so it stays
>> available via dynamic debug when actually needed, without cluttering
>> default boot logs.
>>
>> For example, on sm8750 this produces 125 such lines in the boot log in
>> total, 80 of which are CoreSight-related, e.g.:
>>
>> [    0.057190] /soc@0/funnel@10041000: Fixed dependency cycle(s) with /soc@0/stm@10002000
>> [    0.057211] /soc@0/stm@10002000: Fixed dependency cycle(s) with /soc@0/funnel@10041000
>> [    0.057229] /soc@0/funnel@10041000: Fixed dependency cycle(s) with /soc@0/tpda@10004000
>> [    0.057249] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /soc@0/funnel@10041000
>> [    0.057254] /soc@0/tpdm@1000f000: Fixed dependency cycle(s) with /soc@0/tpda@10004000
>> [    0.057260] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /soc@0/tpdm@1000f000
> I reported this elsewhere a while back:
>
> 	https://lore.kernel.org/all/Z6t45aOGDkotqM4Z@hovoldconsulting.com/
>
> Are you sure it's not the coresight bindings that should be fixed?

No, Johan, I don't think this is a Coresight bindings issue.

This is the mechanical result of the standard bidirectional graph 
binding + fw_devlink's direction-agnostic phandle scan — it will appear 
on any SoC/CoreSight topology using the standard binding, and there's no 
alternative binding syntax that avoids it.

>
> Johan
