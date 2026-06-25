Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F69737DAB3
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 08:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782375939; cv=none; b=VVHSqDJ05sQgvSpVS+c78Fu+/eLhJtQCuxwkmk0wGrZjzd7pD3Dtk+t+MhMZvITnlrZSSKWu8SU/xNoJBrdQkAEj+pxM+e7j+DCmOnLFFEwLmf8JVLkY5oXyvLZuCmexyut5ZgfpUa301CG1NfpZYN0j6bX/IE9TrNwxMsXEs20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782375939; c=relaxed/simple;
	bh=OPhLm1rJuIi/m2Pvh96og04FAYQ1yIsttDFmqZKVvPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vw0MFX+HHzPxAtAePjBwH9ld8s6Hm2O4AtUb9AzNUE0uLm73sm2aBwfnKmiskW7rtuNh3aHjlLwOa6W8P7gLwg0NZctgBtEiIj7Wlcyls8yAYY4pe3lw4WvF4XEmBb84jxxXwnMhaG4pwJ/Qlzv4W2P6t399lFDxYgaBvsc1ejk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y0/nxr4g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kxhUfiU0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y0/nxr4g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kxhUfiU0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3e7Jv1225333
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 08:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1hkulWBVykslW4PgXVL5UYKLv2kiiaA3D+8uNzq2FGA=; b=Y0/nxr4g48zscEjE
	vs3fahqZWVg8cCh39meTKghe/FBOXlbW7HUTVWXKunt4w/wL0UOd8ZMidqvASI04
	sC15nSXITDL7PGM5nTEILjsYMLYKQBHcq/1Wg5zXdhTCVBloh42PALwhh2F+abXY
	laXylebvd9N6wH1DwSlbk1FQ/USqMcSq7P3d7/nDHEveotJfXTvuQNoKkn6bAkrH
	HXgjcZCXOkLjrAGTd7eLrTqFqDCegd9Ugf2N1fYKaL6PsB9rmOT/Pox0DzvrGO2h
	TlzDD/4BLTbFVekbFuZu8O0TOHkhcXKunu8ip069dbAdLAaXxZkD+Z110qEtIsaf
	vXxB3A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uyqh4u4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 08:25:36 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8de97bd8459so6919936d6.0
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 01:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782375936; x=1782980736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1hkulWBVykslW4PgXVL5UYKLv2kiiaA3D+8uNzq2FGA=;
        b=kxhUfiU0OqiNPEsmj/mRElOYvadwdxdjY5+wyaEmyTxApmWMl7AbohsNPLpy4gEQXN
         /wPRcD832yOuMJVTPQAaKwJQ+fj3YbSOrTeENbsuGCgBfmHLquJg7XfG4w8Wwlij4JSA
         0ZnoegLV/duNVG4wBurPiYN700EOlE8xUmBqWH4/joEK09LIVaifVPEs+9oONNEUPPAX
         QIXdh91+wc1zptubz+0vjYxL4vNRUMGUHQWIVXC2XOf8HefPMnGnm3nnErzPNYIwZxZq
         9PBCf/hPd/8oQk2Thl8QdoIsbrHwt7emz/Cje56l+xBVo+G0GKQMJOgR/iA70poxesr6
         NkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782375936; x=1782980736;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1hkulWBVykslW4PgXVL5UYKLv2kiiaA3D+8uNzq2FGA=;
        b=WEOOEVtyJVJcW9p+u89N1EXFDJV2ZW6msELI6Fr58MvlMZfRO5PV5xpb/NCddindG2
         /nmg+R04ZKlK4O/Hs0d0WTFdCoLCcaBC8G8NvGAAU5cxqOXZDt+cyRo40UhMuoYkuD2f
         76TVqS2eWR30lg1PWTi2qJG3+ntk0IJuKA8sur05ZGmOCwv5c3oBN8dPu0PPAio3r2S5
         T5HSIVD+DxBoWELEgU9O2DhqmiIcocA1QbyKhi3913iZutxL8kJRT+mupexjgq7fL1YU
         JWCVcsE8UaOqXS9xq1+3meWSBxyQCoEhhrbxeV94v4QkreXrj/6IoZHyLQnzRe+n/XS0
         JXww==
X-Forwarded-Encrypted: i=1; AFNElJ+1HXCOnjU2lsZ08qjg7I5sdfSY6Ia2n2zy/I2n/eSrhoqWqqbBbwHcqohr54C9aq/9pLh9JrYX1R+v@vger.kernel.org
X-Gm-Message-State: AOJu0YyxA0C9zALtCFygIHWT5YzE8WueJx6lKJ0RqgzyMBfYk02ZNaVc
	EgYT+WzNvnqEweptXtfA0A34TZ/v/KqB0mxo2wETgmzdXaH7xRAxFVFA9Y79I5BXhDgC37VUplW
	X39yXFqlvxkcsnefMTRzGKAqCMyNtSTbNGph42eI9sTjlyFtbdHb3Y7fJEHzouS2UIQJOQD4t
X-Gm-Gg: AfdE7ck8JwIsWW6DOZP+23Dn6h5eQQovPkgDGuYpio6uYPtG2M9Aasw4+LEnG3Btdz8
	gw1Fw+FTaulrbXZJgWKkKnedIh4KdkDqQ6FMz1ien+D4WnnHHZ+o1GeazSO1swrran5iimWlQIk
	2f19eThvkA5DlVjt9LtaBdoN0cbHndUb2Bb/qsBD6aPt0V7cmzuv7JHi7OnRLGtemDBzJtxOBRS
	jEyDN7FyG2CYFuGPCXydoqEydDcLPhMofBeFd5SXSWWW1Tubpxgk0s264loRUmbDmsTz4oTTMMX
	n7rCELwVz/IeYdaWD9FZelYGGnVlt4faxlIFsF3Ws3VY8/wF8Qf20DAXMYCFGUqi2xoEgtEQYNP
	1VxYHYJQsI9o+QzdYm38Hqsp1smd7qqHcVNI=
X-Received: by 2002:a05:620a:258a:b0:915:2b2b:fbdc with SMTP id af79cd13be357-9293b572b56mr121495185a.2.1782375935573;
        Thu, 25 Jun 2026 01:25:35 -0700 (PDT)
X-Received: by 2002:a05:620a:258a:b0:915:2b2b:fbdc with SMTP id af79cd13be357-9293b572b56mr121492785a.2.1782375935031;
        Thu, 25 Jun 2026 01:25:35 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbbaa5desm128737766b.2.2026.06.25.01.25.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 01:25:34 -0700 (PDT)
Message-ID: <7d8064bc-4dfa-4990-ae36-d68cbc9cdc9a@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 10:25:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] input: misc: Add Qualcomm SPMI PMIC haptics driver
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
 <20260616-qcom-spmi-haptics-v1-3-d24e422de6b4@oss.qualcomm.com>
 <eb693705-c0c3-427b-a924-5aa907fd65bb@oss.qualcomm.com>
 <1bcf00ae-2558-4c3a-970d-aee1da0c06f9@oss.qualcomm.com>
 <29806448-0588-4590-8540-a689ccf1e7b0@oss.qualcomm.com>
 <82253653-bd85-45b8-8520-e2bb213ca48f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <82253653-bd85-45b8-8520-e2bb213ca48f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Uks8YxDPmyY1IKJh6oatpAtUUwAdpMBr
X-Proofpoint-ORIG-GUID: Uks8YxDPmyY1IKJh6oatpAtUUwAdpMBr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA3MSBTYWx0ZWRfX0R8ksFrn2X8u
 PAWaLvXFoxzfm+r6MjRyN1jNaG5M9HJX89wBZww7W5DvsuOx39CN7OYMA79OJWpYy3+q25uKmWQ
 q6tF5CkOsjkoTHIFVciYrA/VIxQPfJE=
X-Authority-Analysis: v=2.4 cv=EsLiaycA c=1 sm=1 tr=0 ts=6a3ce600 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=NcuwlND7g3vlKZA_ufgA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA3MSBTYWx0ZWRfX29hNDzbxP2t9
 DwTF5lc+8G9zZ+j+dDL0pU+Ll+LUtGEkz9P8yygtczZXjJnRKHeUdneEjAKuRgzt8SIFFmvtP+J
 4i3OqROwRCtjjEQ1A97+OM/ALTbBaYfspDne3VF5gyK71SBRqvUxeJiuiOx64RF9j7x+WSsj5hG
 Xt47UW8Z4Z8P21GRNwYmirjksp2c05bFSpymma8Tf/kCeaHSF/TRzZrSyTdD9qpe0Ec90RWBQdq
 Ikd6mpAImXfFLweS0UFREBzhX3zfeuTIIfCtH6Q5FOuE19bKJXhbnzWPVwcfpJNyRsC97VooyJO
 RzaxhRTALxcLJB0KXkZNJDBocYdR8TbsOYjuYPf6QXiK2di5jO4qZ4IOlsSBR4Ks9lAe1TXEN0t
 eK73EIq252ZZ7kZe1Id6nc7Hsrs04INgKgalK4qMIpHgO7E8nJerGMK0MVZSB+6Qpj/PpnK3Q6t
 l0TMCYEDIHMy4pafckA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250071

On 6/17/26 12:12 PM, Fenglin Wu wrote:
>=20
> On 6/17/2026 5:30 PM, Konrad Dybcio wrote:
>> On 6/17/26 4:31 AM, Fenglin Wu wrote:
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D ptn_bulk_write(=
h, HAP_PTN_FIFO_DIN_0_REG, &data[i], 4);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return ret;
>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 for (; i < len; i++) {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D ptn_write(h, HA=
P_PTN_FIFO_DIN_1B_REG, (u8)data[i]);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return ret;
>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> So if i'm reading this right, the first loop will always write
>>>> 4*(len//4) bytes and the second one will be entered at most once,
>>>> to write len rem 4 bytes.. should this be an if instead?
>>> I should put a comment for clarification. Here=E2=80=99s some backgro=
und: FIFO data writing supports both 4-byte bulk writes using registers [=
HAP_PTN_FIFO_DIN_0_REG ... HAP_PTN_FIFO_DIN_3_REG], and 1-byte writes usi=
ng the HAP_PTN_FIFO_DIN_1B_REG register. The 4-byte bulk write is more ef=
ficient, especially for waveform which has several Kb data, and it helps =
to reduce software latency when loading effects and reduce the delay in t=
riggering vibration. It also helps prevent the FIFO from running dry duri=
ng data refill in FIFO-empty interrupts. Typically, we use 4-byte writes =
for the initial 4-byte aligned data, and 1-byte writes for any trailing r=
emainder.
>>>
>>> So it still needs a 'for' loop here since the remainder could be more=
 than 1 byte.
>> Right, I mentioned len rem 4 but failed to notice it's a
>> single-byte write.. anyway, a comment here would be good
>>
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>>> +}
>>>>> +
>>>>> +/*
>>>>> + * Configure the hardware FIFO memory boundary.
>>>>> + * FIFO occupies addresses [0, fifo_len).
>>>>> + */
>>>>> +static int haptics_configure_fifo_mmap(struct qcom_haptics *h)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 u32 fifo_len, fifo_units;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 /* Config all memory space for FIFO usage for n=
ow */
>>>> What's the not-"for now" endgame for this?
>>> The hardware supports more modes than the two currently supported in =
the driver. One of these, called 'PAT_MEM' mode, also shares memory space=
 with FIFO mode. However, 'PAT_MEM' requires memory to be pre-reserved an=
d waveform data to be pre-loaded. The entire 8K bytes of memory can be di=
vided into partitions, and it is configurable, with FIFO mode always usin=
g the first partition [0, fifo_len], where 'fifo_len' is set via the 'MMA=
P_FIFO_REG' register. 'PAT_MEM' mode plays waveform using data preloaded =
in a memory bank defined by the registers 'PATX_MEM_START_ADDR_REG' and '=
PATTERN_SPMI_PATX_LEN_REG' (they are not defined in the driver). Since PA=
T_MEM is mainly intended for hardware-triggered vibrations, such as a sig=
nal from a dedicated GPIO triggering a short vibration with a preloaded w=
aveform, and although it also supports software triggers, I haven't found=
 a suitable way to support it well into the driver under input FF framewo=
rk yet. So, I am currently allocating the
>>> entire 8K FIFO memory for FIFO mode only. We can adjust this later if=
 we find a better way to incorporate 'PAT_MEM' mode into the driver.
>> Sounds like a plan.
>>
>> For the other mode, would that GPIO trigger need any OS intervention?
>> Could you speak a bit more about how that works?
>>
>> Konrad
>=20
> I'll try to clarify the 'PAT_MEM' mode further. 'PAT_MEM' is useful for=
 latency-sensitive vibrations because it preloads the waveform into a fix=
ed memory bank, then it doesn't need to load the data of the effect in th=
e HW before triggering the play. When playback is triggered, it plays the=
 waveform from the specified memory address and length. This memory shoul=
d be preserved, and the data is preloaded during boot. Unlike FIFO mode, =
it doesn't allow data refilling. The trigger can come from hardware via d=
edicated GPIOs=E2=80=94currently, three are supported, each mapping to a =
memory bank set through specific registers. Software configuration can be=
 done in the bootloader or in the driver probe, but the 'fifo_len' should=
 be adjusted accordingly. After setup, software doesn't need to manage it=
 further, relying on the GPIO signal to activate the playback (for exampl=
e, a pressure sensor triggering vibration to simulate a physical key pres=
s). The trigger can also come from software using
> SPMI commands by setting the play mode, start address, and data length.=
 I previously tried using the 'FF_HAPTIC' effect by mapping 'hid_usage' t=
o a predefined effect in the devicetree, but later I found it unsuitable =
since 'FF_HAPTIC' is mainly for USB HID touch devices and not general vib=
ration usage. If you have any suggestions for supporting 'PAT_MEM' mode t=
hrough the input FF framework, please let me know.

I don't really know much about this part of the kernel, but at a glance
FF_HAPTIC seems to be roughly what we're after - quoting the cover letter=

of the series that introduced it:

<quote>
Haptic control
=2E.............

The HID protocol described in HUTRR63[3] must be used.

The following waveforms should be supported:

| WAVEFORMNONE             | Implicit waveforms required by protocol     =
      |
| WAVEFORMSTOP             |                                             =
      |
| ------------------------ | --------------------------------------------=
----- |
| WAVEFORMPRESS            | To be used to simulate button press. In devi=
ce-   |
|                          | controlled mode, it will also be used to sim=
ulate |
|                          | button release.                             =
      |
| ------------------------ | --------------------------------------------=
----- |
| WAVEFORMRELEASE          | To be used to simulate button release.      =
      |

All waveforms will have an associated duration; continuous waveforms will=
 be
ignored by the kernel.
</quote>

(i.e. reword 'press' to 'trigger' and we're mostly there?)

I'd start prototyping in that area (maybe taking it out of drivers/hid/)
and see where it goes. However as I mentioned, this may as well be my
wishful thinking.

Konrad
