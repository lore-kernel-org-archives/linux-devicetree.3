Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794239264;
	b=RCrRYDEh64KtKY1XJGa50y7Hu+pfLaQnqgL6Zmq9NZFNXX5tYog99gzor9zz4bczoqzr
	 wUWgsofX1woBPnpCreOr29v0ul3M/r3udH4faZqOU7TWwHLfFZmya8w3H5dA9jtA9LM7W
	 /gpjjqbT/EApEqtcM9ZlpT4uPNi2sbEBL1dSddoYxh+IgvfmGVDSZc2eVeHTpCaCvtfP6
	 FqiNiQuiLHo/0maDTZTLE4o6ZMTdQx/b0oVF9zPgGCJ5iHRJCGy3t0i70xQCUiLi0cImm
	 Rm1GdgWs+ZHmd8I9MNS+qM0/dci3B7cIeyzQuv6eMJQYOcu8aRsC3L4X2vTaQv8A79A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239264;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mBoR5s6oMFRgFxiQj9Lay5NRlrAbxIjp94cmKVZAPUs=;
	b=AaiStpPRTn0/XylAok2/rNOq9+1bVlyAilucRKv82HJusKNG1iu8aQpXA32DYhdgnxJL
	 Iaf0qtgyu+yqejbEcozSpI8nFUQ3waAf6iJ8T7UADSS1Hi1CI9i36e+0GZU+BajdVk0aE
	 j0DEH0V+ht8EWSbmcdZNs98qfjZ8xvpZ8mevOtwynE6eHcDvx2bAKAFBciod27fOYAljN
	 qVuwytxwXqFGakPhPgx6Va8van3Gd01qEO4lxDNQlDHDDjCKKWkfT50mtQTrUJ2opDlxb
	 ewb5r1Nw/B23JmBJz7MFp3+7df2TYyT3JarR235c34XbD+yf4pZP+sKQcgMVhYgzSng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i9cOGYDw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kzv6+DSY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA196606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 15:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA196606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i9cOGYDw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kzv6+DSY
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFDki022892
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 15:47:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mBoR5s6oMFRgFxiQj9Lay5NRlrAbxIjp94cmKVZAPUs=; b=i9cOGYDwelk3Coqs
	Lnm8maHufdSmKU9agpzwAvGEnrGe1g5maoL0oTeVD2vMKitnjvDHsdPqVeSvVaeI
	8nr0owWuRV8qvu3XZ25Qbi3V4RogyWXbuzeeqyOrkViAgfS2pQJe96Hj74eVjOQX
	bq0SN1Pt8Z+6XxT+aLfgNFz5p+vlBgxOf19lybW5u333SlW1ZvHV3+qO3TrqqIbZ
	ocpDF5hn9FSnNyM7KsdzYX85ruuSxU7+zvrLBl3AGbGSpypeBdxqmoJvhts8qywP
	8glHvw+f0GasDtS1A9Ktp7VJF8hXE38GZ/yPi1Zg9j7yntBx/XJjX75vgZG6qtgV
	nJ9Cpw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydh0sv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 15:47:42 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5edf86a8c00so233834e0c.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 07:47:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794239262; cv=none;
        d=google.com; s=arc-20260327;
        b=LFyfjfW/SLsfWSIUKpObrk1zb4pm/zSVpud6gFNFpAQ2lOZ9fIDGEJ01uwfhAO8bC1
         5csQ7+qaF841t5puFbS7X3ft8him25THIGKF+7VhZPb7dBRfhveNS0c45Q4THDc0xhl3
         Wfqave9LmCI4n8GffZJZVKvu5IibbWW0AVRXPJ1huzEBiGfht1S4r9VLL7xyyHNXQCMZ
         DQFvcfeiz7F6McaDCDxKPeB2UmPHb3Isw3JU9zjib6x3jO5JrPjzf9gj2Dzn9gREAKwR
         dlZM9E2HqReAiDmUmeG9+++5pgtn3c4JnowZT5ux7PpvrANNcMdngFphTVtYms0A3yTJ
         YPXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mBoR5s6oMFRgFxiQj9Lay5NRlrAbxIjp94cmKVZAPUs=;
        fh=GEucjWT8T50YDeH6HbLl7AvqHEFlvw/RriwP2pSE4qI=;
        b=SBjpY3Ln+efUljFf9gAt1H9g2AabDUFDO5JnnZt7eYnA2fwZGkNa8uNWBfnkYajlJe
         qCnYuBnKf0RSWVy2J/bCNJfCRd3CVFdRzF0uLC7Q9HnF3YlRXjyDSFPUcwYn6SS4OSrF
         RaToKRII5mwjtyAs7LOFxfFgyH5Hzg9Y/j37CmQdEHXVNB4v+RE46emWwAuqXLxr6IMm
         RCENZZZoBV4UuyxDvMhftJA4pSForSKZn+6rWIQy9FXMTO22yvpM4Wk58rSzNpeuR1WL
         W5H/HbPhqtKQMjjBLkkXcizFwQFumUGEt3HPvqR7122jbNeQNr3jpDNEIkIGn18p7jKc
         nwpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794239262; x=1794844062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mBoR5s6oMFRgFxiQj9Lay5NRlrAbxIjp94cmKVZAPUs=;
        b=Kzv6+DSYorJUfmW3b/1Nd5IkiAlsIGtF7TF05V0gXbGaSirHRr2N4ZksG+s2hpxScY
         YEX/AzYU+99UGqwoo/DhDRyn8wQHXOWrBjLTXdXAruUGdR2esmZBU22e7mvrRRJnGqcT
         GAHT5inkSAWezPVFdAxpzcODRaAOeT18XKi7Sp8r9WJ+xPJpJBXFxsKFLRPO59659iAD
         tSMIOp+mwJl6EsoXixAxik53nCzleje645Rk6MfGaCxoI1BocsbYtIBeInifRU6+558x
         1gSYtIjsjlV6NmrQUkzc7pKEcJPoLbD3qkXmHMaB5p2kFRmhFaVvhAjqAlDWKXlGVdNP
         lH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239262; x=1794844062;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mBoR5s6oMFRgFxiQj9Lay5NRlrAbxIjp94cmKVZAPUs=;
        b=vFJFSg4lyIk8F7F9RnVJwE41vVzEYjkwP3X1iNregke+znp8lI/0Dc4YLDmtfHp+Oy
         esZDAwQ5ieFnTZc6gJ4Qce4F5pCLhCKFFjtYbS3bYbumcvscNjtc/a2EQTmhJ7f1Svlw
         iy0LUqi5QcuSiQLLmPmQTqQ8jHrLg0K6+oDMi+VIQMc/E8d1N3qsK/6SY4UUbw8F+ylF
         EeFTyvpR4W01pfQP144A8adZzI0iHEWgOdf6rG91swuTSxQefViJVpjubYK+pU7nv5k0
         u8AOPqr615M83ky2cxckCO9K1AgW54q5P/U5zo68hjLRXz6t2sdQPR2gkfXAu0zp7r1x
         dS3g==
X-Forwarded-Encrypted: i=1; AL+hErESJF6XSckKRtEMV4yOkjlzmcvJaRfdPcR46UYA3bXuADxHK5ehkGhBYKoZqbiGXT4k12e0P24Vyhcy@vger.kernel.org
X-Gm-Message-State: APuU4Z+g41rsHjeoL7pURz6Cjqfobjl3tqTMmfiPPiBxZ+dcPBBSnLQj
	SyLaUowdQx5cHblalTrdvwy6FY2E1YvZLsH1C6sjy4mULzzg32BKZHGujfBZUzcoLzh00Kc1c5l
	neAXJnIN5cEXmxSMqVVYX6W0shoOm5ZvUeT2qjZuC4HTamMvCOPxVeDQVllwMRZnEa08TpIvXU3
	f5WWokKBJkiWb1u05+lIbw1vFa4kdBHP0dygD94rM=
X-Gm-Gg: AYBFou34Rc05+i2QozbWXayXVDEdu5A5ADixArfh62K0xu/+pZA20XA7DAjO5hpx0Mr
	SfuweotlvQYvH8iLZyRThDPC3YrDmF+ls7Cdu6jDmTWbTr4BLY8+U6YXt9gy4/0nZM8ghi7O1db
	CvGS/hT0QuRT6Z8dmmdzLD7av4f0+JGnZZN4NFH+3SwmQIY0hdlO2TmmDqAg==
X-Received: by 2002:a05:6122:32d5:b0:5ea:b294:f0ab with SMTP id 71dfb90a1353d-5ece7143d92mr1480894e0c.2.1794239262140;
        Mon, 09 Nov 2026 07:47:42 -0800 (PST)
X-Received: by 2002:a05:6122:32d5:b0:5ea:b294:f0ab with SMTP id
 71dfb90a1353d-5ece7143d92mr1480860e0c.2.1794239261690; Mon, 09 Nov 2026
 07:47:41 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 16:47:29 +0100
X-Gm-Features: AclHuK-Kr7TGoM1o4LoUqHv6QGn1qOkyGnkGREVNczQg09-nH_zkvO-sNuQEANo
Message-ID: <CAPx+jO-WLCnVecquKbVaCcErbhuFt6OHFUmzbgNHjixx0r-wMw@mail.gmail.com>
Subject: Re: [PATCH v27 00/10] Implement PSCI reboot mode driver for PSCI resets
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2MiBTYWx0ZWRfX2hCFSmdDPhyh
 1UWiiWC7ywNgw7Nej3SAT153z6I1gLobw5R/DM8kp7v+u9X5adj8jrXMkPglYiYNmz3JS/67bKW
 zWx9Gr052hHFXwkZXKvjhkc2f7prB1I=
X-Proofpoint-GUID: bYq15UIYAQjW_SfGTnCcaN_p7qlPsnp6
X-Proofpoint-ORIG-GUID: bYq15UIYAQjW_SfGTnCcaN_p7qlPsnp6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2MiBTYWx0ZWRfXwoxzvlbcgs8N
 KU6YcKHRaK/4v4KXi83dUP3dSa7zANPIMMOrxuaPwBJIcYen04Sv+trkAL7TxcT9stqh6aE/Tmw
 uhMc1VO+gsByD+VJa4f8pvvcXKsf5SMGenJh1EFkuDMqNww5GZ7O3ZAk/WlipclxBGSnuax2s4Z
 xp9fJpMP0zKiwLY+ZL/Y+ao2JRPtWFHqAICRn32MAQVuPrb6OaDifpfEGq/SooPIy7bASEvb9dp
 mlxKi9RfkxEKPAoM6owBTprzERWdC4XYEolFmKZUUfzpvhvG18suRFvJHGK5wEWNLtkIb2/j+NI
 fyiaa4c2ki7PNfQCMmcFTaJIRCNO21mCqZjRlnl0Qa5/akOFbiKWLhSgG1GniGiEMlO7+MDDs9U
 VvyrVMXFOQ3TLr9EVjfLJ3lYDundO5GlMWp/3xA3EueMAYL1askHB3IAHWrWO7X8Yrm58AbKb1V
 ql5mFNAQfY3tCWZWo+w==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af1eb1e cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=7LcMNQwP9uozhxO2aV0A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090062

On Thu, Oct 29, 2026 at 10:01=E2=80=AFAM Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
> Userspace should be able to initiate device reboots using the various
> PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
> patch series introduces psci-reboot-mode driver that will induce
> command-based resets to psci driver for executing the device reset.
>
> The PSCI system reset calls takes two arguments: reset_type and cookie.
> It defines predefined reset types, such as warm and cold reset, and
> vendor-specific reset types which are SoC vendor specific. To support
> these requirements, the reboot-mode framework is enhanced in two key
> ways:
> 1. Support upto three 32 bit magic values as arguments. This enables to
> support for a 32 bit reset_type and a 64 bit cookie).
> 2. Predefined modes: Add support for predefined reboot modes in the
> framework.
>
> With these enhancements, the patch series enables:
>  - Arch Warm reset and system reset cold as predefined reboot modes.
>  - Vendor-specific resets, configurable via the SoC-specific device tree.
>
> Together, these changes allow userspace to trigger all above PSCI resets
> from userspace.
>
> Note on introducing psci aux devices:
> Based on feedback from Bart, Lee and Ufee, PSCI child functionality now
> uses aux devices instead of an MFD driver, with psci-cpuidle-domain and
> psci-reboot-mode probed through a common PSCI aux device enumerator.
> Reference discussions on this:
> https://lore.kernel.org/all/CAPx+jO9Hi2R_UnCEhsXLwf74c3RTb+RodaJ6SOVXbQX_=
eHt++A@mail.gmail.com/
>
> ---
> The patch is tested on rb3Gen2, lemans-ride, lemans-evk, monaco-ride,
> qcs615-ride.
>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>
> Changes in v27:
> - Removed unnecessary headers from psci-reboot-mode - By Bart
> - Rebased onto current linux-next.
> - Link to v26: https://patch.msgid.link/20260928-arm-psci-system_reset2-v=
endor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com

Overall this looks reasonable to me, but I will take a closer look in
the next few days.

When it comes to the merging strategy, it seems like the best way
would be to funnel this via my pmdomain tree. But I need an ack from
the relevant maintainers to make sure there are no issues with that.

[...]

Kind regards
Uffe
