Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157124ADDBB
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 17:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781198550; cv=none; b=NQSotygPSw65CBuCLxP/dlOZUc/t1KhckYquAEqB2OwCZEYGct9/o3nkYsEOzQpUxJFgcObOQuig6dFpNJIfwcbvgBXfqs4SoOLfbpYKf1N8vhm73M4/t5K7DDr24OxmHf38Xqc99Gf6ZJwOYTgupfpYD7BOFEwUP7juogBLP88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781198550; c=relaxed/simple;
	bh=+lxjAfe6wEYUQH5kHI10jNSfjIWCZOMpz/WaS1Y0Kkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XjpaViCa0dMRlHcxoM4Wl48q6H9ogyv3Jm3GcPBtbGAPtMeUyZPUEb3ej9nJolx5q+B6ITSM6Xu1E3M2fz9Oma6DI8+Zyoy3U/SUDYuBdRWOtGLjeON06fZJSd8pm34Y15aAbdVijQEkfq4/picDohMsnmOyCac8x+8OqqkL/1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fOBUXJM8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZK2zyuKT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fOBUXJM8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZK2zyuKT"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BEsKLU956256
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 17:22:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VeFocb12chtGwgRowRCL9ILbPc1n/e3pDIXkrLx6bWY=; b=fOBUXJM8nBBWSiQW
	Dsl3/OsySuKXJYVvkutyz7epGp/u6YW9bqF5KbHF7p+2AX0xOYzA7UjuAGAP+t/K
	uRmqipE9b2YbeN60VmsdZMg17q1cjV5Oh1/tXtCDxh9k+PUj+Lef++4flf8HAXMA
	5mA+k/Z24QAGMr6yOeE2QEFJMmiUidYwGBjYlFAGZf9tluLhlNPIs0JZ+AB07VrG
	CEdVV+Qp3RmjKhZ+FTjl085yUBghCqDeaPZ13bc8zT376V+q1QAYk/GhBJihOd3J
	v2LXjHt2WqKwzmyDz8gQ49fwLehXewAimF67hG/lgsWcxwbD+JGgmWtc24CHPsqU
	avGGrw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe704nnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 17:22:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c32f4b1bso618955ad.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 10:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781198544; x=1781803344; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VeFocb12chtGwgRowRCL9ILbPc1n/e3pDIXkrLx6bWY=;
        b=ZK2zyuKT/gs/Car0e0ro74Fu56sNyXvflb5WOMUGrYNWlLEEItey02i5LXrmyqWn7Q
         tWhxkeJQo9N62iI4Fk/yWHAd2LwWQtEk6l8rrV0ZqQsJOdi/KGNb0cXh5D/TlFlEVWEa
         wam98cx4SKojiRgeFSpAT/BgCFDuYLyX6i/bgvJzlwS/vxqGlHR1w9hnCQmzTw5aHTZg
         HTREKTCbIoKLDeBCvzfAEEV4XmpfoBgg4XSrbTQhGZs9CcOjul89akNfKSEunnTqLU8X
         KEVyCweS09bCusl1qQxDr9Q+q+iAWlkP1+gLBZxFmZOFdcffSqnoOh1mejh8KGZ5SVQK
         pfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781198544; x=1781803344;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VeFocb12chtGwgRowRCL9ILbPc1n/e3pDIXkrLx6bWY=;
        b=SHHMM+rcDBttRGdT7e26lAlhjZYjA4AYmHZNMYvzXXoDvcgO5/ZCSViKUJgYC2ouvk
         eDOY4inJJrHIIaNiqms0IR6AfIeH362zCETzpJyalvBdkyo+4AeUWm1x/dFULlybYp6Y
         P+Ydi1YZMwvXrnu4hee6+owzWjSZ0AHGPRa5JEuHTfhOC1RLWlo0v2VVS5Y6OF8L1RkW
         wb85uZu71LiNSLyHq3J1r043LorhlxjZzAZrZuQgk+08Aon2Bl7AM545R9YT9T2NQD36
         yziOwWqsJ4lZGfr4lg8sO8Ev6ZBuYHQmQrpVAg/CADxpjkHgS1M6usMbRBQ8ZZhfOWOO
         Xdsg==
X-Forwarded-Encrypted: i=1; AFNElJ8d4h6U1tw3X6N5VNts402cPCkM9CfaW+0X7qkGOlBqB5Zu+y4F0O2GKvfr8dvaWRwCXpPcQnDDivWJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyBUSeZwcpNR6iltz7nmlu+sIQMCodydY04kPdM5Oc4boF4/+0U
	C3qJ+ftP6MWzMSBxYcYmov3Ap7y/1wWVIvZaRuw+x71BjTjTPQqHrzJwDVKQtz62vs0mebPum3I
	giMHM6qgXPp5oESgjbiWnu1++UfKKWDElwm8qlZJT1fqvu0y6jqESYf0xiD2JE/2+
X-Gm-Gg: Acq92OHFttvXXHKCuyWbJguw0YwI1srfI+p6F1BaP2n0rP9uNxlnQW/nt7DMcFcSjgF
	rG2RGnwCPbkd5ywHDjOcEcQxKiX06uGUsIHyBeh2Vak4N5kfVwju8eBSzIYjQGyOqcg31qNIqPj
	cO9W3ZThuo8/NgqEh9ZnStIU5hhhZLH3CNJMj0uXO9/3ZDFOae5KYjitUcJPyt3nww0avxdruLC
	H2tWFmB6/IBXMtcLl+OZsD/7u3VG6AbjWT/GmWNvc32QRWigyLS55W7SUqeI4yjq8AbLdTL7m/V
	lGRrCMDERCK2TVQtD2EM9EloAMDlkSpX5clo0uFhLhFK0OyjJWoq476jAX/aSJdTOuP9B2FXjO6
	L3jFKSFlmnUsypeCjdJnABoE4dFDQlMvsnz4+sSJVI72IBgvb
X-Received: by 2002:a17:902:cf43:b0:2c0:cb90:1e08 with SMTP id d9443c01a7336-2c2ef1870c9mr46091185ad.0.1781198543536;
        Thu, 11 Jun 2026 10:22:23 -0700 (PDT)
X-Received: by 2002:a17:902:cf43:b0:2c0:cb90:1e08 with SMTP id d9443c01a7336-2c2ef1870c9mr46090585ad.0.1781198542864;
        Thu, 11 Jun 2026 10:22:22 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f85de1sm284705935ad.20.2026.06.11.10.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 10:22:22 -0700 (PDT)
Date: Thu, 11 Jun 2026 22:52:17 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v3 04/18] firmware: qcom: scm: Add minidump SRAM support
Message-ID: <20260611172217.zi2u6b22r3c7jn2d@hu-mojha-hyd.qualcomm.com>
References: <20260522195009.2961022-5-mukesh.ojha@oss.qualcomm.com>
 <20260522202145.9AC631F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260522202145.9AC631F000E9@smtp.kernel.org>
X-Proofpoint-GUID: q-GVm8-4BWl93D2TiYJthVZgiwm3oKGS
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a2aeed0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=8nJEP1OIZ-IA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=eJ65ZG8ybeDIfqJBo1AA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE3NCBTYWx0ZWRfX609SUm60Kj+P
 votgjlmL2MyOx2GNRjv/CSdt0PSTwQUstGjjxtaTMmnVfmHQOcnqxKjmqoan9uoLqhm8+2tXU45
 JEd7BjUwnJpms9pxcJAFEJOH3JfYIZ8ZHQJrLrMVfUE7eKo5/faTcDQ0CLUMJWjW0rKYin39mev
 Otng7t8f43h5/DpuUlT6wlN2QjUwiNR3hQIhVNfcxWoMvADiGH1FaCJqZ/QLEhxS5cQp0Z6P5eu
 +1SN0m744mNtWNBtHlwSb5QNMljsrKfi4vsbeouSkEyQw9b1ufNVW8SOVbvGGAkT73w6eF0Ffle
 7TX7sdiMSh8MutwU0wfDxD07rlwZRfgpSld7PpeQur0Hm/AM4svwbWuO6A7qWJcRIDuayVmYN/s
 oZlp6nEKYMP0ERJ4OJaYQfnVKdpwfDSsr8EJxYzVzH9TQ+rkvEog/BTdVfHeqQTDB3jUNDGhme1
 ZTIGtPLk92TRjxeMrLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE3NCBTYWx0ZWRfX7YGKCSyqEsZn
 ce0fgExfjDb16HLipuOMPrK9TpQ9Vj79MvIxUneJXMbK1jpcSKjTj37JpfR8mEUVbH8dzuqqN4Q
 gpbEqHKPC0xbGZBpg1sM+v/1OYJL84g=
X-Proofpoint-ORIG-GUID: q-GVm8-4BWl93D2TiYJthVZgiwm3oKGS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_03,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110174

On Fri, May 22, 2026 at 08:21:45PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Missing smp_load_acquire() when reading the global __scm pointer in set_download_mode() risks a race condition and stale reads.
> --
> 
> commit de197846d8ecb70e3382c65171f1e37949d3d114
> Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> firmware: qcom: scm: Add minidump SRAM support
> 
> On most Qualcomm SoCs where minidump is supported, a word in always-on
> SRAM is shared between the kernel and boot firmware. This commit adds
> minidump SRAM support and exposes a minidump_dest module parameter so
> the user can select the destination.
> 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> [ ... ]
> > @@ -568,6 +583,14 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
> >  
> >  	if (ret)
> >  		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
> > +
> > +	/*
> > +	 * Write the destination into the always-on SRAM so boot firmware
> > +	 * can read it before DDR is initialised on the next warm reset.
> > +	 * Only written when minidump is active;
> > +	 */
> > +	if (__scm->minidump_sram && (dload_mode & QCOM_DLOAD_MINIDUMP))
> > +		writel_relaxed(minidump_dest, __scm->minidump_sram);
> >  }
> 
> [Severity: High]
> This is a pre-existing issue, but is it safe to read the global __scm
> pointer here without using smp_load_acquire()?
> 
> The driver publishes the global __scm pointer at the end of qcom_scm_probe()
> using smp_store_release(&__scm, scm). Module parameters are exposed via
> sysfs before probe completes, allowing userspace to concurrently trigger the
> set_download_mode() callback.
> 
> This callback reads __scm using a plain, lockless memory access. Without a
> matching smp_load_acquire(), the CPU can observe a non-NULL __scm pointer
> while still seeing stale or uninitialized values for its members, including
> the newly added __scm->minidump_sram.
> 
> Could this lead to an unaligned access or page fault if writel_relaxed()
> is passed an uninitialized pointer? 
>
> Note that the newly added set_minidump_dest() correctly uses
> smp_load_acquire() to prevent this exact issue, but
> qcom_scm_set_download_mode() remains unprotected.

Will raise a separate change for this fixing
qcom_scm_set_download_mode().


> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com?part=4

-- 
-Mukesh Ojha
