Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795445098;
	b=1j9rg6UphgazdnSXp1cqagYAaCnOyIgD1mRoSaG+G4GsYUqfDv7lCfsqu/qBYYHm+dkC
	 8+AGTEi6qmIzpJp6yQvLXnypLfyLKReumquTwX6Z/HjcWSz+4CmjjDk6xEFH+8P/mHk4f
	 7jZ5uvUGRARbN0H8kbkvpdyi9Aq7eNpiSzfBZfp4CbwMxgzZX+h1GuYn8/I58z1YdAzAz
	 ygCSz87gvY89qPzPpSe8TENvNecfIhkxpFRogzQfMa7CcSx+jzSt8YTjUC+Egz42VkQgc
	 VAaOIGECJuB+vioZkAtiVACS/XSWfW+Ihiavb81xTkVpJ11dipV3tFjHW/kIlukrBAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445098;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/d3C83PDhTdKS4Gzi1sKn6/sMS00aaFlTGMatqgMHxw=;
	b=idrP4z8KtPRT4Lu+FP7OEFA9m+vT3JhMyj7BN/Lj0QlCmm785S7q5YJZztc7M/t9021t
	 3CvRHX3JeBkkmVhMT7HdT3l0ZV724EtJZJkSfTeyiW8GLfCyd6OKYNam7b/OheyxiIEzt
	 2+6KxrxPodZIgM362fwxYhY5pYJwantQ5KLLH/vnag17mZq3Y33wxv4oufbOX3Gzr8qub
	 J+Tp2CjfhEVJUmuovIHl4jqWYLHXMuHtlX1CCgl2Br9dU7jprPiI1itfR6eJTCoCU5lfi
	 EF0DkQrqa2y1QN71cRQws/NH7f/iL15dgzctwaIAIT41eBME1hUAcWfwBgu27i3NYbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eaZOWP70;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IdaadmqP;
	arc=fail smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C549606A321
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C549606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eaZOWP70;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IdaadmqP
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDL21l3072550
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/d3C83PDhTdKS4Gzi1sKn6/sMS00aaFlTGMatqgMHxw=; b=eaZOWP70t09Rj07+
	cPJieXBnlKsehB+GrJAydZDT4+PLIYK5pwuW2r5gNJH0Ojd7pEgMs9r1m7UJdBwM
	7zQKYMmWL5kxVdZlZToJgb7EbSrJo+bICo+4pzanjkiC32c6sBdLCP0QpHDvY6o7
	2N3LRchjol5Kcyj9VoiTImB5GCC9sG44+izkryoUavpx5ETRmQ8hsqXj0PFeoFPE
	VVs3eVVE4trvEH/2pNWN68ptXYzHit7ybHQ9WjKMfQry0Hl+hcfvNyem1wBUiSP8
	j+93DPws1QuTtVdpd1VoOT/++TZwI6m4sUIepZrJmTbemGkiwsq21zFG4MnOuAvU
	ZL8I+w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7sgku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:44:56 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b69b8c6dd5so3323426b3a.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:44:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795445095; cv=none;
        d=google.com; s=arc-20260327;
        b=dREbduHoUXhKN+AHc//lJfmlBve2p/LmLrz0KW5lA2Y2L+TJ4LVNuLX63r1nI6DWO8
         6NsrGBJJ1AAbN9zMgGEYmeOjL1QoQ0DiXFfyYyd2SoMeEfOQb/CPths/77as+dyPDxpo
         UKZ49prwYGuMjzT3XM5UHVec324UVRuLJ1q1PWwSsw7zC1EjsgOwUyaHrKIEuqhz7aPB
         VdMqXuGZo4xrRnWGzAx1CTYIFuWgHnENq5RRR3YFFhEpZYtKGIPPwSUibI4R+yO7/Lgf
         t0QF7TI882ICvfLcDYLIE8IlqqLEEWW9xr/UcEsB4RcarNZ3UNefocUFkQTAUjfQg+f5
         9+ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/d3C83PDhTdKS4Gzi1sKn6/sMS00aaFlTGMatqgMHxw=;
        fh=W/Au/8f0Y0hdTJaRP13ocwpGqDKDIQMBaL0agEqjWTQ=;
        b=FPrccwSaz3YRJJUzlbH6rJk+4VS68sfFqEq6fSShcWFYgpaT2+SCthrddtL8I5Ji0Y
         dqk3yBb0lXRcUkKnexO1ZzXDJQ+k2hnYub3GCPWQeJ7+VXauXDGrQgXrk6O6nuoFwJj+
         RaflnVxA0zd82OgPDsE4UX3xlux3i19ONZMRGFL1jFUzzYDRpU85YC8eyLjngsB1vXph
         6xhveHHFIubWGJAYAegR4LSrmxk68niy6KD1koohdFuqfFGzRwIXhwapuW6amZzEzMHl
         9HG9OucLsspRK04rfXZ5LZN3NGWXaNVOrf4R97MPYQAlSlqbT+N90EfiaKIC3VP0OLA/
         TxZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795445095; x=1796049895; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/d3C83PDhTdKS4Gzi1sKn6/sMS00aaFlTGMatqgMHxw=;
        b=IdaadmqPxlrWInEksHGTbMHQw+6cBlh1Ikp0dHsSCrliSqatwldTV7brzaR61dmqKg
         iTsH0WcKNbfqHa9/RMhyk5JAvXhN26AKkI2aCRXGSHTXTAXnQCAaKv4wwvY5zyZYQH9M
         3Av+Dlg6ItpjDuBdmcatiEj2bxGjQUqzCedAxmsC/PBPjBkB+JCg/Nt9MAlg37HYym2P
         6bz9XGYBnwEiPJ2b2lFsi/m1C3VcxkoLdxrgb3vAgBrfPEKfDDKMDdyUZaN9altdouBu
         IOeCGzmX0UIvlwVKLU2GVkdYOhfiDPj1tNsAiv7CoYOMzBgbM/LIg29fUU0Eh52aA64L
         NUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445095; x=1796049895;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/d3C83PDhTdKS4Gzi1sKn6/sMS00aaFlTGMatqgMHxw=;
        b=s01PO7GGFVJdcr/y0qMEG9uKtByzRlDZVIB9ovKodvvMK0g00NP9Fc/bUs9dTj57Lt
         oFK1OsVK3+ueM4KgDKopVpYCwENeP7jMFoF9dHAyeM6lhieBsU+FdgzJdB2jlkqOgetc
         bfzAyX9cSpUczgikfMMcVikCmfBgqIomM72dIDM5RLd+rkwc46zO9q3XGPp/w1TH1gi3
         zaqkIX7k3ct293DQC7jfslxoF9M14VjvXI5Sgr68SRO8yu0PWU5CYjD9on9rm8PtFyXF
         0TjOOQFZc9zc2Ek7WUphiCPFhKcboTsW5dnCQhQeuahnv0UJfy/qNyfew7BgV7XOyM+G
         O8ig==
X-Forwarded-Encrypted: i=1; AL+hErH1RSCftApQ6CvisxGgdAdqoetsqeuQT/wmlfW68p2melea/ZGPpLe/eZGNzwCDIOdT82/14YKHGLW0@vger.kernel.org
X-Gm-Message-State: APuU4Z8s/A7dLsD3VwH2nLuMuxTaal21PClzQpwTyShAfWdnADX9er2G
	TopKbfuZ1SQEaj/lfUf/RtrcvvN8NrTUv7SKwpRYEFZZi7iqET5mDRUSBXPz/aAnvZnHpnRqqBA
	AEjHeaBEhYV9buAMfPEZb/CUnmMJA3dhuoB5RKi6Wkuimpwx2+OKE+UFqlDlDdxCLFxh53yt75B
	+DaBh2beNm5ezjZ9J2X+VProj5o/h5v89PpoA7vMY=
X-Gm-Gg: AZFdTZdfzcg1vUbsxU5GUYIf/HU57ZD6yj4l3dCFu8Klgt2BBivnv3dm0I60UBjbfhT
	hvTbSBpLh5fHe5fSVXJzJKkbTQGSPfLuhSRph3PBtXr0ZyjOcOLeZnh8sKqBhSbVv4/ZjNqy+EK
	oJ5xz+O4BmjwNr3+HodNl99t/yAHmAGBdmUtzUfIYSi9B+PmkBKHkV2gz+o2wlC7qMPRocIWzjo
	ZqAu5e5gEPYeCz0
X-Received: by 2002:a05:6a00:18a0:b0:899:268e:c848 with SMTP id d2e1a72fcca58-8c87cc450e4mr9837963b3a.48.1795445095408;
        Mon, 23 Nov 2026 06:44:55 -0800 (PST)
X-Received: by 2002:a05:6a00:18a0:b0:899:268e:c848 with SMTP id
 d2e1a72fcca58-8c87cc450e4mr9837944b3a.48.1795445094856; Mon, 23 Nov 2026
 06:44:54 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-s2idle_state-v2-0-ad604182e7e7@oss.qualcomm.com>
 <20261113-s2idle_state-v2-1-ad604182e7e7@oss.qualcomm.com>
 <20261116-icy-free-lionfish-c3eed8@quoll> <d3060950-04ea-4f9b-b160-0e068946e623@oss.qualcomm.com>
 <20261123-humble-native-ibex-7d2f72@quoll>
In-Reply-To: <20261123-humble-native-ibex-7d2f72@quoll>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 15:44:43 +0100
X-Gm-Features: Aa3M54pEpZ40tQjszZMv2Cjc9ZKJszGaoEabHp-a4xi-MEaol4PsN--f8rv57Hc
Message-ID: <CAPx+jO-e337v234_wF5QKDf5YJaEZE1-+_Mo5=Y9BfwuG+29_A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: power: domain-idle-state: Add system-state
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b045168 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=I1gXTs31tpYBTtf-1f4A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1OCBTYWx0ZWRfX1jsY17Xv46Jg
 cUvdPRhDg4djxyrpVcYWE3M58gxj6w2XzjXvwmQOz8OE9/w9C1jMjk6kLN391I/t7mF25lw57fm
 g0Vk8u4Rdi0rCjKst7YFsJa3d/5Z/akyOXIaLNJQSQBJakv/ohURCiEiUsft3poskagxkGq+Fq5
 6+tqB0EtlyzEGaRhYXMLCg0+/JNKGt+vdllsDpbLJNiBdIuyaEgEUBQaTnIQvyQFsJibSeiDo4X
 CAVO4Gp22zGxCc886YaIStEQBJbsxGJRWfKFnnGwVqz6+S9p8pEnYMpcgg2J50FEgT/tykwzuS6
 VThmXFWZrqwl/Ef26SZ2B2Y6TouL2i97Sde2LIKgaYcxAoqt4TcfaYE2bnT9VkKZBnGdKmW7DR7
 eyjoYxbLVXIPEVsZhD9HiBTNfBdKlV5LMFSEFjFWwB+zPLb98bPMxb/PZukLTQ2saXHvJWwczMU
 tlIPUP7NG+Q1RsFJsbw==
X-Proofpoint-GUID: hBflXLas2aKGTDDMHGGBsT6TkkQftVNX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1OCBTYWx0ZWRfX+dJh1TqwvEae
 QtDL5Fw3+V0yxnSVwHDWtjq/40sGbRpf4cMs0HwM5kyWXGD1VlBt6cb8NEh20bUkcT1A5Eetw45
 52b7ED9gvGfdQwaRI+mb+X7JKFdcgNw=
X-Proofpoint-ORIG-GUID: hBflXLas2aKGTDDMHGGBsT6TkkQftVNX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230058

On Mon, Nov 23, 2026 at 9:20=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Nov 17, 2026 at 10:34:52AM +0530, Maulik Shah wrote:
> >
> >
> > On 16-11-2026 17:28, Krzysztof Kozlowski wrote:
> > > On Fri, Nov 13, 2026 at 10:25:25AM +0530, Maulik Shah wrote:
> > >> Some domain idle states require system-wide coordination and are not
> > >> applicable while the platform is up and running.
> > > You repeated the property description. Say something more. Why they a=
re
> > > not applicable when platform is running? So if not running, when are
> > > they applicable? Why?
> >
> > On certain platforms CPU subsystem deepest idle state requires co-ordin=
ation with SAIL subsystem
> > such that both must be powered down in coordinated sequence. During wak=
eup SAIL subsystem must
> > be powered up before CPU can resume. The wakeup can take a second or mo=
re.
> >
> > Selecting this state during opportunistic CPU idle can therefore cause =
substantial wakeup delays and
> > repeatedly interrupt SAIL operation whenever the CPUs become idle.
>
> The idle state latency times define that. No need for a new property.

Unfortunately they don't. The extended coordination that is needed in
the FW to reach these states has nothing to do with latency.

We simply can't reach these states unless the entire system becomes
suspended. From the PSCI point of view this can be compared with the
PSCI SYSTEM SUSPEND call, that we use for suspend-to-ram.

If a "system state" would be voted for from cpuidle in runtime and
when using PSCI OSI mode, the FW would always return an error code. In
PSCI PC mode, the FW would typically downgrade the vote and pick a
shallower state.

In regards to ACPI, this can be compared with the S-states.

Please have a look at the discussion [1] I had with Sudeep around this
to get more details.

That said, I will work with Maulik to clarify this. Seems like we
could improve the commit message and the description of the property a
bit more.

Kind regards
Uffe

[1]
https://lore.kernel.org/all/20261005-s2idle_state-v1-2-3c402c66f388@oss.qua=
lcomm.com/
