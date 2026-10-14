Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1636B528427
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 14:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791988574; cv=none; b=rdVzLcAF0VJd3ZZH8mLwuCtCwUCvxsJQgSTE1PWeX2Ppb+mfFRaR9vflxLfGCG9R2DnY5MLEK72LVW/fUUXmZ09eIABX5dZ+2+8+DjIc21mwdCmfAuQ6zQQp+IFAPBTl8UerUoVx3d75f8hZH2mm3ur2ca/IhCibB/ao8eZ8gJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791988574; c=relaxed/simple;
	bh=F4rFBUaCOL5YOfxzVdVtwUZSolYZcsFGUHKO5GRCAEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p0jOSZtO+jd+t/QSkyBcKc0gnX3wU3DrvxoBUdOTV7krn750iOXTrTlKlwz06UR0o44hJfQSdzYgDM/bZUg+FiM0krpCNG39zp1usIOsusJQb9Jo/4H5n4mvUm5BapEYBzsp2auOaU5IRPM0jia/DqmoZz4dDAhjrk6gylOFKFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pwHAZV4I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OpVIyN98; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pwHAZV4I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OpVIyN98"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E9eEdv3696421
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 14:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OUrow3hu1m0q48SV2EF3u4y6
	PxIgCefasK/JsgE8vO8=; b=pwHAZV4IzUXXXT040taa5LQ2+q88yiR8qVauSaeU
	T/CHXjUkLGYZVBLnNCjbZ8EltKJRmvWhFNr+cmllwLx1dwQHJEPuXnXmTsXBrjW6
	N0jJnyGGlxdL8tQC466Vl5BNNef3YC/xTwaK3PsrU+D6RCjTw4QAepszjmGBLUe+
	YDKthtMK/9eCXU/MSy8odkeAVa26h8LyWBAzJe+Bf0H+zXVmz4f2VXbNHM/IhCXg
	JoU0iNu474aGHpd96tceGcRcXugAWbpJcXZpUDnuQHhKYmBix3mpiJ+3WRoN7Cwc
	i4GE4DX+sV2nMV+ka8M3uU3fFul2KpkHLxfBHWnyz+rVSA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha7aeh514-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 14:36:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc7a6e4e1so1291079785a.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791988571; x=1792593371; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OUrow3hu1m0q48SV2EF3u4y6PxIgCefasK/JsgE8vO8=;
        b=OpVIyN98u4OcSrdHeAFX70YkGE+MOR7hIVOOBCCY0OfaXobb5xMs0wrBQv9/LYGz2y
         AXBrvw63/+Lq7U64/t9xNosfKEwURvYo8JI2Pgerm7dErrOgOHWCX4/i0HDWdJjvVhWL
         mCvHOpsT24wzQldpQr9m1FUparGsujHi4CaCq9V+ZLQFvm0IK4PhDmxi3h3277klOLJc
         U7U2+SzTvmyZHhp0F8/JaBeIDyB9ffHxFDzxXCoiWJQ7Ks0xw3kCUh3L7S6a8cOBx6Y3
         DfkNanGvbyGoUfZIXLgPA3Ro1PSGr6a2lNOPhRpPPL82TTOjLd/wbpfc8pyTAAT258qy
         yGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791988571; x=1792593371;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OUrow3hu1m0q48SV2EF3u4y6PxIgCefasK/JsgE8vO8=;
        b=0Kqh8rs4M7j7VhjMpyKBj3/e+AaO6w0RcQAAP3g5Oyp3+UC8Bc5SM6FdAiwdfEAat1
         8mRUasXFJUs6qz9nzn7A5snvVU8zN2W8ei4kan0lWPMmB2Ve4tjCAbWOZD92BrOwtl47
         7PpLVRAa1s9FM6mq3hwbZCSdJjmS6bTwXXEufqRKgPP0BQ0SRI4jyWewl7pVJ9qOJD0V
         ZsD1A0pzVQLZTAxNJeDSXQdTLvVZ9ZNaKc5XHJ6x7HFjs4Xanjia3sd7GkIMN7jN0SUJ
         jS7obQk2IrYbWmHBY5iJIsvjw/DJggpKxZsqP5nR3z6ylLjr08Bq7eBRMgLhzQzn82Dh
         0njQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7Ghqb97O9gwJP16GWof4jA++E/w2utPm8AaxwVDIszk95WRiNdgfVkrSzlpUzP4XAmPP/Rml2mcBb@vger.kernel.org
X-Gm-Message-State: AFq9FYLElPnHo4YIy0j7X4A9XIa4lohRPHs0pGOsD8DqHfC4hYdJaP/J
	nI3pfGygAZUgjrDT39jU6cPfseV8S79IezEQXQcvdB4tD2Zq1/80yiDcnmj/eD1xHE/drwGKrf7
	8EVz2KRW75KEu95odMZRz4WtBHf7sxnsypBDst1vmIFQzE88McBJCeyD4EU+Mjq0Q
X-Gm-Gg: AYBFou3kWsWUylm9/uJUjBZUlF5nhL6S5t+VY4WYGATtR9hiv/kFuXBVcuwM9Y0MsoT
	gEz/oy3+wBwJLZoxasjBFjxuqjQFMfgDErWK0SXrB2mFpeIUdc0qjooYgKnVUOOFsTFrddfyM5E
	RTO4ql9dRynQlUljIdxLN03h6k4Md8xniQPUqiFR0mOc/5021a36EW23zeJOLheHKIZ30OREq7o
	zzHskZNpX6wUrAagfGMvi3SJtjvvippaGSryu9ocd1K+chBgbXsDNV1kh1eyczKYtY9oZNV2Bca
	CfkT4FAzrNK6WNVvevKilPupSrfx5L5Uh7YDPlzVlhdx15QhP0Kwo2oYrydWTrKquQvmnMzfcgW
	8oVXMFbHxueIhYns5Gx/RoR+fEFr+Jvd9ymU1ao3lss7hB+MxhLXdeE9e47GXP7YdM21MS1KiBl
	yscWR1zzE6zWa1
X-Received: by 2002:a05:620a:40c4:b0:93f:116:9873 with SMTP id af79cd13be357-93f01169894mr594343885a.7.1791988570947;
        Wed, 14 Oct 2026 07:36:10 -0700 (PDT)
X-Received: by 2002:a05:620a:40c4:b0:93f:116:9873 with SMTP id af79cd13be357-93f01169894mr594338585a.7.1791988570422;
        Wed, 14 Oct 2026 07:36:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d976d8sm683084e87.68.2026.10.14.07.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 07:36:08 -0700 (PDT)
Date: Wed, 14 Oct 2026 17:36:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC 07/16] clk: qcom: Add clock-owned GenPD DVFS
 aggregation
Message-ID: <ygwhik5t6w74xcqz4igmb6t5esmjjgrmtwqqqmo4doj34t7rpu@jkngx4v76rxg>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-7-3041b788e9f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-7-3041b788e9f7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: wokiCODA4dvg3jwqx2ft9exLer3SpgTn
X-Proofpoint-GUID: wokiCODA4dvg3jwqx2ft9exLer3SpgTn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX6DvBKBR48pxm
 OmaNILFuGaQGSlQPZRT3kk4Rel9/E6H8H3XbUBbaUI8TVf+coWNo7E37NF8Ypli8u9r4URnK5Pb
 Jq7Z+qwcyR4vppjMh71x7QAk1ySgSV8=
X-Authority-Analysis: v=2.4 cv=NctzRGD4 c=1 sm=1 tr=0 ts=6acf935b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=XRegeI_o-g_BgEuFQC0A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX9Rv85l0RtjAg
 73gjZX1ghvjZQSMAIbikXTPYLn6foVtJiTHt9WOu1QEYsxzymlBxLFAMUyaGprQ4eIehmx7L61k
 Nw/aDL5bThlkZQGkjeeQdT0sZ9xzAV6NuEqFo9go5hxr/C48kepPMTnhrJ/DIzGZlGJ71hOJD6j
 lLE2/rW/O7XWsr7cHuu8gwobe5pNf6FGSXimV4gH6jS2rwo1n8krnwi2kAM+cExmKH8RrnCN13q
 lW0dNnpGA+0BHiU6mCu+BKFNzDoLZLbjr7n3fJwguDbvFg0ZlYulOkF4rjxAIdmvpo56FvtH4EB
 2/KWNd0L+8MUnmnb+5C/890agI+NpfHRPdGQl/0asg1tpyqo1J7Z9SsneGhjBqTvDJbcfzp4YzM
 v9wTIorwr81rCzWr2Pq5CnyTcHNfNQcVSW7XmDkHmv1IaeIbyKpH9tE/lCaJy8NaVhhDHDr8+Ev
 JFaioBpaPInSCnw5SoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140057

On Wed, Oct 14, 2026 at 02:19:07PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Clocks on Qualcomm SoCs need a minimum power rail performance state to
> operate at a given frequency. We currently leave this to clock
> consumers, so a driver has to know which power domains supply both the
> clock and its parents. This ties knowledge of the clock tree to
> individual consumers and doesn't protect other users that prepare or
> change the same clock without making those power requests.

Why would they prepare or change the same clock without making power
requests? If it's a legitimate user of the clock, it should have an OPP
table. If it's not, it should have a separate API to set the clock via a
legitimate user / aggregator.

I see one usecase where this would help though. If the clocks use
different power domains and the corners on one of the domains don't
match voltage on the other domain. E.g. it's not infrequent that the PLL
(powered by MX) requires performance vote change at a different
frequency than the rest of the clock tree.

> We can't simply pass each clock's request to a shared GenPD device
> either. The device has one performance-state vote, so each request
> replaces the previous one. If two clocks need different levels on the
> same rail, lowering one clock's request can leave the other clock
> running without the level it needs.
> 
> Move these requirements into the clock provider and aggregate the votes
> per power domain. Keep the highest level needed by prepared clocks and
> in-progress rate or parent changes so that one clock can't withdraw
> another clock's requirement. Use separate virtual GenPD devices for
> these votes and controller register access so their power requirements
> can be managed independently.

The biggest question at this point would be the locking and lock
nesting. What is the expected order of operations? Currently it's
limited to pmdomains, but for some of the (older) platforms clock
supplies are expressd as the normal regulators rather than pmdomains.

> 
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Makefile     |   1 +
>  drivers/clk/qcom/clk-dvfs.c   | 574 ++++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/clk-dvfs.h   |  40 +++
>  drivers/clk/qcom/clk-rcg2.c   |  93 ++++++-
>  drivers/clk/qcom/clk-regmap.h |   6 +
>  drivers/clk/qcom/common.c     |  26 +-
>  drivers/clk/qcom/common.h     |   3 +
>  7 files changed, 725 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 6affb5073f26..b1330047fd58 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -2,6 +2,7 @@
>  obj-$(CONFIG_COMMON_CLK_QCOM) += clk-qcom.o
>  
>  clk-qcom-y += common.o
> +clk-qcom-y += clk-dvfs.o
>  clk-qcom-y += clk-regmap.o
>  clk-qcom-y += clk-alpha-pll.o
>  clk-qcom-y += clk-pll.o
> diff --git a/drivers/clk/qcom/clk-dvfs.c b/drivers/clk/qcom/clk-dvfs.c
> new file mode 100644
> index 000000000000..e6490c4dab94
> --- /dev/null
> +++ b/drivers/clk/qcom/clk-dvfs.c
> @@ -0,0 +1,574 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/device.h>
> +#include <linux/device/bus.h>
> +#include <linux/err.h>
> +#include <linux/list.h>
> +#include <linux/mutex.h>
> +#include <linux/notifier.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/slab.h>
> +
> +#include "clk-dvfs.h"
> +#include "clk-regmap.h"
> +
> +struct qcom_clk_dvfs_vote {
> +	struct list_head node;
> +	unsigned int level;
> +};
> +
> +struct qcom_clk_dvfs_rail_voter {
> +	struct device *dev;
> +	struct device_link *link;
> +	struct notifier_block nb;
> +	/* Serializes the vote list and rail voter state. */
> +	struct mutex lock;
> +	struct list_head votes;
> +	unsigned int last_successful_vote_level;
> +	/*
> +	 * Local conservative floor included in subsequent aggregation after a
> +	 * failed request.
> +	 */
> +	unsigned int safety_floor_level;
> +	bool active;
> +	bool must_contribute;
> +};
> +
> +struct qcom_clk_dvfs_clock {
> +	struct qcom_clk_dvfs_rail_voter *rail_voters;
> +	const struct qcom_clk_dvfs_data *data;
> +	struct qcom_clk_dvfs_vote *votes;
> +	struct clk_regmap *rclk;
> +};
> +
> +struct qcom_clk_dvfs_transition {
> +	struct qcom_clk_dvfs_vote *votes;
> +	size_t num_votes;
> +};
> +
> +struct qcom_clk_dvfs {
> +	struct device *dev;
> +	struct qcom_clk_dvfs_rail_voter *rail_voters;
> +	struct qcom_clk_dvfs_clock *clocks;
> +	size_t num_rail_voters;
> +	size_t num_clocks;
> +};
> +
> +static int qcom_clk_dvfs_find_level(const struct qcom_clk_dvfs_data *data,
> +				unsigned long rate, unsigned int *level)
> +{
> +	for (size_t i = 0; i < data->num_rates; i++) {
> +		/* PLL-derived rates are not Hz-precise. */
> +		if (DIV_ROUND_CLOSEST(rate, 1000) <=
> +		    DIV_ROUND_CLOSEST(data->rates[i].max_rate, 1000)) {
> +			*level = data->rates[i].level;
> +			return 0;
> +		}
> +	}
> +
> +	return -ERANGE;
> +}
> +
> +static unsigned int
> +qcom_clk_dvfs_aggregate(struct qcom_clk_dvfs_rail_voter *rail_voter)
> +{
> +	struct qcom_clk_dvfs_vote *vote;
> +	unsigned int level = 0;
> +
> +	list_for_each_entry(vote, &rail_voter->votes, node)
> +		level = max(level, vote->level);
> +
> +	return max(level, rail_voter->safety_floor_level);

I guess you want to avoid having too many voters, but would it be
possible to have one voter per 'signficant' clock and let GenPD itself
aggregate all the votes?

> +}
> +

-- 
With best wishes
Dmitry
