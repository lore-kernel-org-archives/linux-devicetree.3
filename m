Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31A543D4EA
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 15:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778166163; cv=none; b=T8lxvt98vv6JiRqxdjTFRKj1LZRffqqW9O0xuolSgxD85gzMfdLDPnClxqO0kAufv2x6nKOW3pnMpl8QFgRqGntpOCMmxNEcVbwlI9ur9TAq4+ZiQUIrt43/oeD3UWfhKO5R5HWfRu3TLo1Rb1utJMIugPSscMBzv8qhQJVcBTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778166163; c=relaxed/simple;
	bh=4NruyGbEAjQ9fNHWxuBTrAEvjRIV+oLjJ7mgTskuTEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SFup8g+awiiXCTrij0YGjy7FCX1SrkviZ+K5pAXoHPD53YcXbpqCrf9eOc54kYxlLxQaUGde31YHptln8Gkt5CN3BT7xtMDbPMYOJQIfnmsWS5AoaH7kGDpr4meCI5MThwA4UOgx9zxHbptfdmIPQQO/imJgeceHTHEKr+F0sYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bGlXFa2w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ffxxkEh8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bGlXFa2w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ffxxkEh8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647BZ2A6682842
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 15:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vD8rLuIfJsXL3d98M17NTUY/
	Q058ckP8ZzVqnLZ0pi4=; b=bGlXFa2wREwWZxnueC/joHpkHZo8DDGV5vw/dR8G
	aeUJDA98yC0AV7b53NjOoa7SSVfOFSpKx/A9SiF1cWYAbr46MTe3HGFa3LuDP0MH
	zTG8Zu7ET2QA9cIgpRTPDYKX95cQmaf7d1nPRDVyYGBgV1dYXDrn+FW1+lNiAyPi
	57F00L5UNoHRvIG+Ry2Pq0vhu+tfAa5kGJcpEs5OQedibIFD/Feq/oZDEeCSO5lY
	WVxSXRJnyXLnvtTLOoWayXDbLJY/a/tlHPtB7E4wF0BrcHXS4eWEjsJwz06sLj+Q
	v6Hl415/OKSeS6cVWfTqn4Hn9CHmcjcQPXtfvFAN78t7gw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhat53w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 15:02:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3650a4eb60dso1033270a91.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 08:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778166154; x=1778770954; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vD8rLuIfJsXL3d98M17NTUY/Q058ckP8ZzVqnLZ0pi4=;
        b=ffxxkEh8jdjQ7CpP1/jbCAUoROvdfIErX9M9FRn4BQZQMOTvPnZ2K5/O/QFU2oXVp/
         n4DrCrXYcllJqa08Gk5o9rzXjI8EO50LyvpTqdIlczLA7w/V6X6IOjU/uu9x08ue2+iZ
         uYBlkATzB3pD5eq5/LslD+Iw6GFFqU8qWUNoHefLFObwbP6Ocx9ZJHUcFjaX98niBQv8
         Wj1TBlY3q0qngULk7Dbf+Kqf0wAqFzZq6N25cvf5LN+63q9Dw3KB70J6215dlfL8YA4T
         tKTYIB1QvkhhYzeC9rEdDDLKEo7nFy1JHXZH/+dssuevNIDZQUKhZHsq+IY0qfk4i5CB
         XEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778166154; x=1778770954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vD8rLuIfJsXL3d98M17NTUY/Q058ckP8ZzVqnLZ0pi4=;
        b=pNpeN5iXAMOZ093bTYNHanNDxCwl1YU7JTPTY5o1Gbxci/Sina7PpOInudd2GwFnhi
         N3xIg0ZzJS568slN8LdtYvNnpqdtXr8agjYQGuukoupK/Q25DqkuOJY8I9sdqRwz5Hme
         zoIeZWWpCoV4VmEzW84xCc5EBxmo2Y6VrBmUNNBc46SVPQY+3NVgouFWoD6q8VOnkJBL
         dhb+3b41kl7OTacx2I7AFWqStwvmv3WS0RU/CbfF6s8FhNVLW5bTVsrgg4IB9g+OVRcb
         NyYPN8JkJalQuwvCj49uzFDzaQL0LyDU/yC/YZlqHfoRkrDPRRR1XnrETp0OXleDGArj
         y4VA==
X-Forwarded-Encrypted: i=1; AFNElJ/TsIR7igK+rJTFosGch7po60KiHa1MzgQPKZi/7RHyDGeUiIA6wO7rLR3pUA+zbIAAUwT8qmv1s4YV@vger.kernel.org
X-Gm-Message-State: AOJu0YwLLJ2+5Lk7i1BjBYNvs23g36qjCZJKLN4HNi+13QL8mImWkQvz
	AvafKeCf7QH0ai6r+zqiMvsXQ2EL1sXtVNxg4PzI48UyPfd4OvuyVBxU8DQqC6IlcHM/AcIFwdA
	04hUdOjbEEW6xWBLOQll81BBoBwqanVTnXrd9Fr7IN33UMtSdgxbwQzsxnRde10p+
X-Gm-Gg: Acq92OFtda8gWPo7/sxhR0cyF32nw5c5d79Z69NcOVi0i5KDjgCSJ1yHpdPzn8bAQPc
	f79Ii0kAHzIzLYVlGtuYwgxJcXZzWLFQQWjX6sdbSDNZAb9pQUXVxcLDnEKm8WZLmbcC4JhULOS
	pIKBdFqXAtr9pZXvmusA/SiY/R3CfLSQu0NalXygipGtmJrsYcv7VirXG9kb78Rm0896WZq0F1R
	puy3ZGc7u2BcuQnbZh1EnBKo0uFfLJapugsBGrhKFcYeA+kFmN8ioCGZR8nYX0bo6awXEc66Zeh
	vGFwPBIvZRG78bb7dFhkH63gF4SPfNHPpuUYWJ2SPW8BExrfLYHzrT4Z8WmVcWGRBNO8WrDELfw
	eIrguP2+uz7KGyq7pgaSlwKxUXROZ5nihE6w+D022YeoYUVOHdF1j20f14D/7peovKcYrwQ==
X-Received: by 2002:a17:90a:d003:b0:366:173c:9a94 with SMTP id 98e67ed59e1d1-366173c9ea1mr2389603a91.14.1778166153526;
        Thu, 07 May 2026 08:02:33 -0700 (PDT)
X-Received: by 2002:a17:90a:d003:b0:366:173c:9a94 with SMTP id 98e67ed59e1d1-366173c9ea1mr2389485a91.14.1778166152813;
        Thu, 07 May 2026 08:02:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b48bebd8sm6233004a91.0.2026.05.07.08.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:02:28 -0700 (PDT)
Date: Thu, 7 May 2026 20:32:21 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/4] firmware: qcom: scm: Add minidump SRAM support
Message-ID: <20260507150221.qsgcydjiv55pzoco@hu-mojha-hyd.qualcomm.com>
References: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
 <20260507080727.3227367-4-mukesh.ojha@oss.qualcomm.com>
 <3m2bwess4zw3hw2qlkwnmhtclk6ofinxekxfqz5otw65hd6d6q@lfcknrfkacy5>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3m2bwess4zw3hw2qlkwnmhtclk6ofinxekxfqz5otw65hd6d6q@lfcknrfkacy5>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE1MSBTYWx0ZWRfX10dQtdVC3YWH
 BADIIFHFbbpKGdqKIE1eyWkQPqdPqr3Z+QpoC+xEnxR6/LUfxhR+0EGkSJZiTp00SY7kZZzbEUZ
 HnLvzKWVwaGeODqHk3Kt41moED2d7TaIbTwwfBl3QVoIyA/lDgBGWoBwABHkBMWp1gS3EqzOHWT
 +aUaylV+MiJTygBi+eh22vaNEEwr3mRgO9Bh4zYJ3ZRCTqIPr+My1TBEm9FzwSUelDL7bgW9Ak2
 f/MuEGf+MS+xXI+hc0vwhxr2PuLTZXCns5i9gQBJZEaJevHQ7DqO4+4S8h2ZCNRdbUnd/DIX0OZ
 oiZqpEZczVh8dlTN2eLGAOvxj2eyX2KLtkFqNunvdniihY2wBHidbgZTTVW9biwgrxWMJiXKsQ7
 qw/l/9r8rNpvDErhi4jmWkol2zzJ9s0xxo/+UJjpyCG0kfhzV8pSnC1KHnE/KSyzNixe2RdeYUv
 LXN8xBFqHPIJJkzb/2Q==
X-Proofpoint-ORIG-GUID: N_5Zx10E_Bfa_ws8qo2JnutbhZN7iPDx
X-Proofpoint-GUID: N_5Zx10E_Bfa_ws8qo2JnutbhZN7iPDx
X-Authority-Analysis: v=2.4 cv=ReWgzVtv c=1 sm=1 tr=0 ts=69fca98a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QDHPVumCGAZ1rrUqATcA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070151

On Thu, May 07, 2026 at 04:50:31PM +0300, Dmitry Baryshkov wrote:
> On Thu, May 07, 2026 at 01:37:19PM +0530, Mukesh Ojha wrote:
> > On most Qualcomm SoCs where minidump is supported, a word in always-on
> > SRAM is shared between the kernel and boot firmware. Before DDR is
> > initialised on the warm reset following a crash, firmware reads this
> > word to decide if minidump is enabled and collect a minidump and where
> > to deliver it (USB upload to a host, or save to local storage).
> > 
> > The SRAM region is described by a 'sram'/'sram-names' phandle pair on
> > the SCM DT node. If the property is absent the feature is silently
> > disabled, keeping existing SoCs unaffected.
> > 
> > Expose a 'minidump_dest' module parameter (default: usb) so the user can
> > select the destination. Only the string names "usb" or "storage" are
> > accepted; an invalid value is rejected with -EINVAL. Changing the
> > destination while minidump mode is already active updates SRAM immediately.
> > 
> > Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/firmware/qcom/qcom_scm.c | 95 ++++++++++++++++++++++++++++++++
> >  1 file changed, 95 insertions(+)
> > 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index f65b132004a5..b57f8cce7a8c 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -57,6 +57,7 @@ struct qcom_scm {
> >  	int scm_vote_count;
> >  
> >  	u64 dload_mode_addr;
> > +	void __iomem *minidump_sram;
> >  
> >  	struct qcom_tzmem_pool *mempool;
> >  	unsigned int wq_cnt;
> > @@ -141,6 +142,18 @@ static const u8 qcom_scm_cpu_warm_bits[QCOM_SCM_BOOT_MAX_CPUS] = {
> >  #define QCOM_DLOAD_MINIDUMP	2
> >  #define QCOM_DLOAD_BOTHDUMP	3
> >  
> > +/* Minidump destination values written to always-on SRAM for boot firmware */
> > +#define QCOM_MINIDUMP_DEST_USB		0x0
> > +#define QCOM_MINIDUMP_DEST_STORAGE	0x2
> 
> This makes one wonder, what is 0x01

0x01 was for some legacy SoC and don't know what it is used for as I can
not find any reference 4.4 kernel onwards .,

> 
> > +
> > +static u32 minidump_dest = QCOM_MINIDUMP_DEST_USB;
> > +
> > +static const char * const minidump_dest_name[] = { "usb", "storage" };
> > +static const u32 minidump_dest_val[] = {
> > +	QCOM_MINIDUMP_DEST_USB,
> > +	QCOM_MINIDUMP_DEST_STORAGE,
> > +};
> > +
> >  #define QCOM_SCM_DEFAULT_WAITQ_COUNT 1
> >  
> >  static const char * const qcom_scm_convention_names[] = {
> > @@ -568,6 +581,17 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
> >  
> >  	if (ret)
> >  		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
> > +
> > +	/*
> > +	 * Mirror the destination into the always-on SRAM so boot firmware
> > +	 * can read it before DDR is initialised on the next warm reset.
> > +	 * Only written when minidump is active; skip if SRAM already holds
> > +	 * the requested destination to avoid unnecessary writes.
> 
> And writes are bad, because?

I did not get what you mean here, nothing bad will happen even if we write.,
or you are asking why can't I write unconditionally ? we can do so..

> 
> > +	 */
> > +	if (__scm->minidump_sram && (dload_mode & QCOM_DLOAD_MINIDUMP)) {
> > +		if (readl_relaxed(__scm->minidump_sram) != minidump_dest)
> > +			writel_relaxed(minidump_dest, __scm->minidump_sram);
> > +	}
> >  }
> >  
> >  /**
> > @@ -2055,6 +2079,37 @@ int qcom_scm_gpu_init_regs(u32 gpu_req)
> >  }
> >  EXPORT_SYMBOL_GPL(qcom_scm_gpu_init_regs);
> >  
> > +static int qcom_scm_map_minidump_sram(struct device *dev, void __iomem **out)
> > +{
> > +	struct device_node *np = dev->of_node;
> > +	struct device_node *sram_np;
> > +	struct resource res;
> > +	int ret;
> > +
> > +	if (of_property_match_string(np, "sram-names", "minidump") < 0)
> > +		return 0;
> 
> Do you actually need sram-names? Just to verify that it has one string?

I kept the suggestion given here https://lore.kernel.org/lkml/b33938e9-bb5c-4743-866d-4cdccf808a02@oss.qualcomm.com/

Ideally, not needed but I agree sram too generic name for a property.
Any suggestion ?

> > +
> > +	sram_np = of_parse_phandle(np, "sram", 0);
> > +	if (!sram_np)
> > +		return -EINVAL;
> > +
> > +	ret = of_address_to_resource(sram_np, 0, &res);
> > +	of_node_put(sram_np);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (resource_size(&res) < sizeof(u32)) {
> > +		dev_err(dev, "minidump SRAM region too small\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	*out = devm_ioremap(dev, res.start, resource_size(&res));
> > +	if (!*out)
> > +		return -ENOMEM;
> > +
> > +	return 0;
> > +}
> > +
> >  static int qcom_scm_find_dload_address(struct device *dev, u64 *addr)
> >  {
> >  	struct device_node *tcsr;
> > @@ -2748,6 +2803,41 @@ static const struct kernel_param_ops download_mode_param_ops = {
> >  module_param_cb(download_mode, &download_mode_param_ops, NULL, 0644);
> >  MODULE_PARM_DESC(download_mode, "download mode: off/0/N for no dump mode, full/on/1/Y for full dump mode, mini for minidump mode and full,mini for both full and minidump mode together are acceptable values");
> >  
> > +static int get_minidump_dest(char *buffer, const struct kernel_param *kp)
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(minidump_dest_val); i++)
> > +		if (minidump_dest == minidump_dest_val[i])
> > +			return sysfs_emit(buffer, "%s\n", minidump_dest_name[i]);
> > +
> > +	return sysfs_emit(buffer, "unknown\n");
> > +}
> > +
> > +static int set_minidump_dest(const char *val, const struct kernel_param *kp)
> > +{
> > +	int i;
> > +
> > +	i = sysfs_match_string(minidump_dest_name, val);
> > +	if (i < 0)
> > +		return -EINVAL;
> > +
> > +	minidump_dest = minidump_dest_val[i];
> > +	if (__scm && __scm->minidump_sram && (download_mode & QCOM_DLOAD_MINIDUMP) &&
> > +	    readl_relaxed(__scm->minidump_sram) != minidump_dest)
> > +		writel_relaxed(minidump_dest, __scm->minidump_sram);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct kernel_param_ops minidump_dest_param_ops = {
> > +	.get = get_minidump_dest,
> > +	.set = set_minidump_dest,
> > +};
> > +
> > +module_param_cb(minidump_dest, &minidump_dest_param_ops, NULL, 0644);
> > +MODULE_PARM_DESC(minidump_dest, "Minidump SRAM destination: usb (default) or storage");
> > +
> >  static int qcom_scm_probe(struct platform_device *pdev)
> >  {
> >  	struct qcom_tzmem_pool_config pool_config;
> > @@ -2765,6 +2855,11 @@ static int qcom_scm_probe(struct platform_device *pdev)
> >  		return dev_err_probe(&pdev->dev, ret,
> >  				     "Failed to find download mode address\n");
> >  
> > +	ret = qcom_scm_map_minidump_sram(&pdev->dev, &scm->minidump_sram);
> > +	if (ret < 0)
> > +		return dev_err_probe(&pdev->dev, ret,
> > +				     "Failed to map minidump SRAM\n");
> > +
> >  	mutex_init(&scm->scm_bw_lock);
> >  
> >  	scm->path = devm_of_icc_get(&pdev->dev, NULL);
> > -- 
> > 2.53.0
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
-Mukesh Ojha
