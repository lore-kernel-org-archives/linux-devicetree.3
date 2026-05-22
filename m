Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961503672A9
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 17:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779471743; cv=pass; b=F90mMIieYSLQkO8CxIfC9kqxo3Vbz5R5KT2ezo1aGyyzhGlHs91RFNyB/gX4fmgpHpUo96ku+Lqa9D0+CTB7xN67zLfRC1FK5sPBRtZt9s6ieMnF7t13cpt7zux+CAyCZvy6MhJk3nseqvpD2p9oBnYifUmoD6qeKPRkNxDS3Yg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779471743; c=relaxed/simple;
	bh=oXMv3F3/C7jcdAkyz/ILkcyLj9Hpg2wNaYZUR91nrGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cWQO0H33cSx7xA+tci0wuxSZbo2xXbwHb7n6NwzwxA+rSFvPe3nhvg/ETswo8SDhCkp/Gwzbxeh22zCI++Dfq2DLifA5ry53W062byulYvMlmuxITG9ynwmQn/LN0tz8ppVyTvv5SJAlgPWouhDuVT3xsTKBmXVt9aOZe1F53F0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PShlfu9n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LDRMXh3V; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PShlfu9n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LDRMXh3V"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MHfQ7H3601009
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 17:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=SNQk7VFC+yr2lz69rbbAAuhRoGnK8y0rkA2N/S6BXs0=; b=PS
	hlfu9nEHraA/VQ4tjaR4AI9cmDLV4K5s10rpIFSxWKbsF7eRKlWJdI6xqjh9L4AF
	sAxz5gtYDX+sYi/HxqhS3JkJIKjiHOfk5PoUBxaIETy8Gzdl08JsfzrJSukblbIK
	ycaLN5hJk3JMeKldpRBQb121ZxsW6qt+Ohqs+j5u6GO5Y1FkEQmPWkeVQagQzY4Y
	ZSkV6T/gkozq7rrfb/DU1RP4SwcWLZUMdl2LLsZzUgl1QZiQSODyL3ytykeEjHte
	d9m3izsnbQu9NVic1sq3X21cfqG+WThZe9eW8gQ2IND8t4pCiWLD8LEVHN4+/uZZ
	fcFSKdyu+kkY9dLIJfuQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eaury003p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 17:42:20 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-696233b2816so14672940eaf.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779471740; cv=none;
        d=google.com; s=arc-20240605;
        b=IgjAbwyeHdcmU2RLnnoNI2tkz9u6eqUogNhDtHhoMMwTa9OLSNpXkbpZ58rdDsAls6
         gfPBbG/9OGJOAq8zo4wZ1rLG49NLY6g+6htm97uLP8mO4hHM6SDSquFdJT87HA8Y7oVA
         jKNXErVvmizVoXD2mXmqYvTZk2rdif1Uv/i53M/tbiWTA8Y1h7yJR+Vtr/oRyId25PaU
         OyG49j45tMN3eM88KYWq/0j3Cz/uvYcTJITQadVCJsdXidqV6gblNBHIY77OYJlkJI1a
         oIebOxTUrHly2UyO4VBQogDg18QtGwGIIiDbn1bFn2FFNHmL2rL4fPIpwVP6N7JwRU/H
         ZODw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=SNQk7VFC+yr2lz69rbbAAuhRoGnK8y0rkA2N/S6BXs0=;
        fh=OFxQsg/r4JH2YZmlVQxLu1RIZL5GlN7nwOWyHLSU3aE=;
        b=Jf1Sf42FBxy2F5wLEc7/aI3W/0nukHz9ECTvGi+/PvXgDb/1dqDJcgk2myR61f+kG0
         G4FPsgjFhKlmXyb4SLfLb4zXLJQS2r4589w/Q/FMTJG5zJjNJR0YVwWkJPE6hrIn/qtq
         iQ2eB2ZxSa8xA+dI1WFk/De5WToRuB4djHiB57m+Ixcec0Pn1udodnxSDV/sPzmCtXXw
         O9i7GaAkvPunj/HADN8w9crUZldDFIMCHS3JjmL2JLXTjiwbmAJrLYUFp/oBeA51Ep+/
         4dxJBCp0vf/97NC8TQVZn5KOUKJJ4utRQc41NwxO+Ec/W558ZrPBe15rIK4M3O7FPclE
         cObg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779471740; x=1780076540; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SNQk7VFC+yr2lz69rbbAAuhRoGnK8y0rkA2N/S6BXs0=;
        b=LDRMXh3VXG3beoZFr7MCRHmf6rsI0/4FYuaEgaYeeq64zc8heBwi5BRxK/WYTPP63J
         WbT2neHCZJeViFj3FqASclwxz1aF/V6ThGIRGEMga7IiJpm3WxJchN9HYSc9Dv1/aE/7
         CTYeyNZOwafEbb/E8oBGCgmdeRIKMitAyDPWbSBbqaORiiGWJ1K8oMxGx2hygadJbavj
         Xh9s4Mn2QFcnSyD2hyJiNLA13k06WNaqw/ps26L6c7jqm7RnkqCJsa/10Z72dhxHL/1U
         LEoqnpKZ5brbslVx8BGM7Qv1Gi4Q5SeIGvWezlC8yEmwGvP1EZVPMOUHK9JeR/mgPLc3
         h57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779471740; x=1780076540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SNQk7VFC+yr2lz69rbbAAuhRoGnK8y0rkA2N/S6BXs0=;
        b=NUH4MBOlRQ/MX4MOLWDk+zamQkBRz/iBLv+4EGKqHPerIq+za37bPLWvAmn31nzokk
         f5qKX2RJqSRCoEhZubg0+SkmvCef4aR28HXspYK3Bn7tA2TKsBBng4/+5/Fy5D7MqHHO
         JBtKWNcCAuAQTUPwf7G4E/0vTlxaU2Ea+r0nEYiMmLIz3azcTJY3mWhc8sN7rHnuQQUV
         8NWtXErcnpxRTNGCfAt9kU0fnceYGHVATTXygW29KP1NGgM5iPJX6ex1iownj1+aN4nT
         aJbvpL4bVQa/TKLaQ8b8xKWn3lWys1z/EJqvOXft8BsW/BK0XfLFwxcfCyqLKAPWFKUF
         35gA==
X-Forwarded-Encrypted: i=1; AFNElJ9YndlbOmDsNv1LntfHBSy2ADcfPcaOZiVE3vPbddsbHLpltZRV2oOt12o/h/g4WKtq3IUiZhASSiPg@vger.kernel.org
X-Gm-Message-State: AOJu0YyvRKSGbOxIURZkgacEvJeWJTr34J11Tq2IhCwfAVoPKridMfhi
	RYSRt5dxPFYD8XySI3yRHfDYcMFqruZCq31c8whRMfUTCRpHfTLUGyN1dTWAVtYK2v1BNj93AVK
	oc1xs3RBpNVbzXYrShgkGxrF/iSx+FazapaOm13QfWSG0GkXh/OlQJU55jXVy6TV2jzyoF0EYr5
	/+GfZTR6QF8hw1gcmKD73J0B5KB5CoO2gu2j/7X/g=
X-Gm-Gg: Acq92OEGS3g8od/gg8Pf03FoxMNzPvfJYrytSZUo41E6SuR3LzfkSjaLsKmdXlquWOK
	QE0JkmnG4XOeeo5WpQkivBEQnSb8h8sC77rCL2ZybNQAeme5ujTMa/SwlclSPd6GwGvv8QR87L3
	rgyHuhoEmWNge4u02i0bkIUvRxnYzAeZm2gkM8RqktMFukTzvtsPDXtV94xrwiwhQMxXLyBpN4q
	SyfPOk9gK7ZEZ2W77c63A2hzV8pVn/RCGaeZQ==
X-Received: by 2002:a05:6820:c95:b0:695:a638:c6ba with SMTP id 006d021491bc7-69d7eafdf79mr2473668eaf.7.1779471739754;
        Fri, 22 May 2026 10:42:19 -0700 (PDT)
X-Received: by 2002:a05:6820:c95:b0:695:a638:c6ba with SMTP id
 006d021491bc7-69d7eafdf79mr2473650eaf.7.1779471739286; Fri, 22 May 2026
 10:42:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
 <20260521010935.1333494-5-mike.scott@oss.qualcomm.com> <e5b40f3c-25f6-401b-84d3-2fb96897d936@packett.cool>
In-Reply-To: <e5b40f3c-25f6-401b-84d3-2fb96897d936@packett.cool>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 22 May 2026 10:42:08 -0700
X-Gm-Features: AVHnY4I0siniFNARRZUvZAYX6iou3EkipwuWUwmBSRJQLSPUMmCVdlbdpra87SQ
Message-ID: <CACSVV02itF8VWQ6y97mFk0pz7a57c6247CuReZzzpdv7LJ=d8Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1-dell-thena: bump linux,cma to
 256 MiB
To: Val Packett <val@packett.cool>
Cc: Michael Scott <mike.scott@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        vkoul@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        abelvesa@kernel.org, faisal.hassan@oss.qualcomm.com,
        linux-phy@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        bryan.odonoghue@linaro.org, laurentiu.tudor1@dell.com,
        alex.vinarskis@gmail.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE3NiBTYWx0ZWRfX4tJIcT00cLzL
 OHSY/UJkY2p6JC6Q86G92qTY83PdvpeYXE64LZOgx446upLpUorfh87E4cVmc9rhpJlCtW97q+w
 iNZpSaI/Ebn/J2108ROaxi2IH8oNkxZ8BIw/n16l7Je6bJRdTWiN/JxQarZ9Bm9CKR7cnqV2Igj
 ODGdLtaCRsP45d0//auiQD3MQF+MivjMjhYoDXIklhwRHGu0XBqCH2XFYcd9DgTICrIuylmfhUH
 DJ3EEGGTS0MbES2VnmAnpWiLHK1nwbJp7KqjUwYK53f/BvPPchrsh65jLV4dwKA+akwE+UFXKl4
 OhDHmWDNBDlN8ZYD4zDf/1lNT97lMdTnjBkB2b4rzSgXIjNbca+AaxRtSSlpoa8Tr9wluCSRMnS
 oU8wov7LCn+DJNijeFflAhf8h12w5ZDu8z70LeGovv5hqL7amPe1g8uBkE/52Pmr3gzYwL2qeji
 gu8pTH9nunoxqEfbErg==
X-Proofpoint-ORIG-GUID: pDbrDDnIHFB3LFIXrfB3uaEed-PKHbis
X-Authority-Analysis: v=2.4 cv=d8fFDxjE c=1 sm=1 tr=0 ts=6a10957c cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=bUDvy5jRn-tkqcjj8-cA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-GUID: pDbrDDnIHFB3LFIXrfB3uaEed-PKHbis
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220176

On Wed, May 20, 2026 at 8:55=E2=80=AFPM Val Packett <val@packett.cool> wrot=
e:
>
>
> On 5/20/26 10:09 PM, Michael Scott wrote:
> > The 128 MiB linux,cma reserved-memory pool on dell-thena is too small
> > to support the camera pipeline in parallel with the normal Linux
> > desktop. On a freshly-booted system with GNOME running, the typical
> > runtime consumers =E2=80=94 msm DRM framebuffers (Wayland triple buffer=
ing on
> > the eDP panel), qcom_iris video codec buffers, qcom_camss VFE
> > pre-allocated buffers =E2=80=94 already occupy ~100 MiB of the pool, le=
aving
> > only ~25 MiB free.
>
> Huh, I'm surprised that drm framebuffers use CMA=E2=80=A6 IIRC, msm drm c=
an work
> fine without a cma node present at all.
>
> Indeed, with a desktop on a 4K monitor I'm seeing..
>
> CmaTotal:         131072 kB
> CmaFree:            1704 kB

Is something in userspace allocating from dma-heap and importing into
drm/msm?  We shouldn't otherwise be allocating from CMA, at least not
intentionally.

(I also dislike specifying CMA in dtb, since that seems more like
describing use-case than describing hw..)

BR,
-R

> > The libcamera "simple" pipeline handler used by /dev/media0 on
> > dell-thena allocates four ABGR8888 frames at 1920=C3=971088 =3D 32 MiB =
total.
> > That request fails on the fourth frame:
> >
> >      ERROR DmaBufAllocator: dma-heap allocation failure for frame-3
> >      ERROR Allocator: Stream is not part of /base/.../camera@10 active =
configuration
> >      Can't allocate buffers
> >      Failed to start camera session
> >
> > resulting in gnome-snapshot's "Could not play camera stream" and any
> > other libcamera-mediated app being unable to actually stream.
>
> ..however I couldn't reproduce any failures, Snapshot started up just
> fine, lowering CmaFree to 300 kB.
>
> I have even launched both Snapshot and ffplay with a 4K AV1 video
> through av1_v4l2m2m, CmaFree went all the way down to zero but there
> were no errors whatsoever, both worked simultaneously just fine. o_0
>
> I think drm buffers might just get evicted from that area or something?
>
> > Bumping linux,cma to 256 MiB (a 0.9% reservation on these laptops'
> > typical 27 GiB RAM) leaves ~150 MiB free at runtime =E2=80=94 sufficien=
t for
> > the libcamera buffer set plus headroom for video playback or other
> > CMA-hungry workloads in parallel.
> >
> > Tested on Dell Latitude 7455: with the 256 MiB pool, CmaFree at
> > GNOME-desktop idle is ~150 MiB, gnome-snapshot streams the OV02E10
> > camera cleanly, and `cam -c 1 --capture=3D2` succeeds.
> >
> > The companion board files dell-inspiron-14-plus-7441 and the upstream
> > .dts variants inherit from x1-dell-thena.dtsi, so this changes the
> > pool size for every dell-thena-based laptop in one place.
>
>
> In any case, that's not an objection of course, just wondering why it's
> working fine for me and not for you..
>
> Acked-by: Val Packett <val@packett.cool>
>
> ~val
>
>
