Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97A349B5DE
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 16:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789143260; cv=none; b=eo3PM6giH/zq5NCyia8y2zDg+CM7ngCNy6Gm1H7cH+oj0ZzCJ21wyj+wHDlni/AmUk1zadd0qWaCp7Nq0lKpV2qcu7l1v/OA7Xe4q1kki9SlebkndqJDYsY9MKtgE5kgKrHpo9XYwNSmWynZa4vLlQ2hgT8YctqciQS1oOUNfm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789143260; c=relaxed/simple;
	bh=4cUjBgFJKNqtZnCQNtomob6e6ka4EvAOjQwBrIouYCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lwiPtjiKOHOV2sgkEL+ReV4ChhI4QmUpS9LnPbBQ9rVoKvShw6PaomGijAq5JXvrBB+Pr5KCvOP2gBaUm8tsfGXQ3HyhqqhYg00lw38cPuPnyYIDOMA4GGaUctHpzANQBeMUwecwGpBJe3iV9YDlmvHeWB42phhGLvTfi4hvsH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lb0KJ4NS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j5etxgAV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lb0KJ4NS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j5etxgAV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEm2Je3748747
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 16:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MglBtG3VQsjiz2GAQ4sOZe+c
	HnUqc5bv5E4JGeQlNwU=; b=lb0KJ4NSEqBLCXTtT0U+Sh/azaTpjkI3OCvTLPYD
	yn0Lg/niitB2dPUP4gJAhZsjIi9+UiteW5anX2erzrpPvGj67xdjeuEPdfEi2i8R
	BKEvszt5haCD/JZkAd1kgY3tOk//13RbZxk02AgVGfvcn2vy6rLxXCbdEtRCVN4F
	lkmP0g9k1xNkUyFMG4pz0nZgvBs59A5yuGjR3cDnhIYMYn170QrCtDo/X0Bmq/1t
	xE9eUxWteOsP6ziJd67S7mu8g74rs4HF0ABZCHb54rMsaVkg4D2VQrZffzcssa6S
	RJ2hG8fRKPz5092MvUsHN6EiK4fzNpUTcmv0/C6A0he8EA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm729kmc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 16:14:16 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc39363cc88so1198319a12.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 09:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789143256; x=1789748056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MglBtG3VQsjiz2GAQ4sOZe+cHnUqc5bv5E4JGeQlNwU=;
        b=j5etxgAVqGDhNCFy4Xc6OOcMsx5L0/kAmEqRYeEKZspTZOh0b3NTBORW/5f5uFMBmY
         fZzG/CE/trFMG6YO2f07TNJXJRnMiDMhhzRMOV8rgkLaaqsDfi7w+R0oQrAw3D4Ty8Qj
         zcoNYmSAB9k2MJoR1yRQ+oWPHpZvd4z//X7V9f6UIsE0NhWCovpm3XdiyG2loWntRIA6
         lkG9/4PntwF4Y/RnNabosXcn/RGqIpKivNLF8vGhoeM6GLl8StlsvRhlk3I4ac5U4ePR
         U08p3EbPIcpkwfKnShNgleORjVn+DJNjHQhEPzkRw4cHnPxwP5lT+yygWCOQv/9E2vQJ
         6BJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789143256; x=1789748056;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MglBtG3VQsjiz2GAQ4sOZe+cHnUqc5bv5E4JGeQlNwU=;
        b=P1AOd8i02AIyT7rutdgKW00KKkdBD2EIdOHg/r1D2U45t0dqBVxggz8SH+b9PEhuJG
         +yINzCpSudntW+3t2sSgnZQWnTvQu11JzLoLxtU32PUAp1aYRKy901+CzlqceQCygZRe
         yyo9Aika7pf4wKNm5e7J4FgXKMm2mWGd8XoZSwUBjLMBffl41dPgh9vUiu4BjDSQ1igM
         QdemVT2EimNxx7ATV8CaV+nV+8yDGsM3qqNtvjOovWQlZm0/9yPPt7R67GfdolYUm8L+
         j7dZXHOSL0Qajju/sbeFnKmQGZ9b/Vc/ocJIri3gqg+eICzscL1Fvz0IvhEF+FsNTu+C
         BZlw==
X-Forwarded-Encrypted: i=1; AKwUvBwYMYIOi9R1095IFvsF3nbdWWSMDkfkaobAfkDxYLZG7OjOJFrcOOeef8KcdCeTjIMNm6+spczd0toS@vger.kernel.org
X-Gm-Message-State: AFuF++mLwKtDTeP32+6sUyvgp3gaex75cNSnY2xhE3WtTAkKhwvO4qQw
	/Z2jhjysJDSq93g/ju7ufCbnboyI2VnlZyJFxqvM53NzFBfwq5cobrMlWaOButfEwaFswzG+E98
	GLspEkFbDQYESyZGpDIiPvU8fTlY1sv75K8SSxIuRMqT0HPcBFQt0sTdsUq9ED+fslxKrOFeV
X-Gm-Gg: AYBFou2x+3cIA0PsCHSKco/leBVByc4Boy7Fu/JKNyY45KMRoGuSsyJRF4g2+D5hR/Z
	pbsbGGKPrBM3FNHL8TU/oaTiofOnmEprncItseXEvNyssdGOMGiiBdNLLGMrItgdOzTxQm5pXV5
	KC/Tj8jerpAAr3kNZy21aMw/vt0ErzWrTMhhU1HRW6dyL0+l49SgU5gpI795y4EIOdsEn+QQTiV
	062UqeqraDwm1cd2xW/aupRsA9la9fBLgd1wRzzPZR+nuI4vswTeS5wBGfDklIEPB9xHTipJHFJ
	7cDNk4wTPyeuMKTqvx5uzgPlQbReGOGqMhtfqywf332FVJ4nRfoLMwfVML1Sr0DzHnn6DxpDntV
	nj3TJIF271qs7hBJ1AhftM3wzH6o=
X-Received: by 2002:a05:6a20:7f96:b0:3cd:9dea:2be1 with SMTP id adf61e73a8af0-3daecb20df1mr8917414637.0.1789143255888;
        Fri, 11 Sep 2026 09:14:15 -0700 (PDT)
X-Received: by 2002:a05:6a20:7f96:b0:3cd:9dea:2be1 with SMTP id adf61e73a8af0-3daecb20df1mr8917356637.0.1789143255340;
        Fri, 11 Sep 2026 09:14:15 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed79absm8631491eec.17.2026.09.11.09.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 09:14:14 -0700 (PDT)
Date: Fri, 11 Sep 2026 21:44:07 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/2] remoteproc: qcom_q6v5_pas: add per-PD proxy
 performance states for Hawi CDSP
Message-ID: <20260911161407.jed5m2ste6m3ykuh@hu-mojha-hyd.qualcomm.com>
References: <20260910150638.3270162-1-mukesh.ojha@oss.qualcomm.com>
 <20260910150638.3270162-3-mukesh.ojha@oss.qualcomm.com>
 <7ki5lpyd7uswvb7q7pc6rv2irmiej5e5ibgko34xkyvw2kpoc6@pejyfg7vky46>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ki5lpyd7uswvb7q7pc6rv2irmiej5e5ibgko34xkyvw2kpoc6@pejyfg7vky46>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIyNiBTYWx0ZWRfXwuqGSzjwWMwc
 BlHhi4t/K7xJH/Uc5MEuqp0qLgAlIAZyDNRRV8Dd7ggnShDWLzi6l+qcEJYbLJH0Kq/RHB1I2VT
 2pMEe1zjp+//lNVsl0MAZeDCfqpKSV0=
X-Proofpoint-GUID: VyzmCRmeuPS3E_4qdupU-OTXwenikP91
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIyNiBTYWx0ZWRfX6TXQT9yVh4ZU
 /mAzvKYMmNzfmFnWCl53uh9m6das68IeQHUyNPAgQfkPb99K2EFmGf0/EJZLySPgItESfWt9FnZ
 qRFRWOP9PofO9t0j0R1nzz8xosD5+KWPui+uP88UdFnXiseXO/N9Wf2Bn/rhXjmDK2/NzHAaSOm
 0Yqz+dsS3vTHD23FSa5b+6jV4A7JsrbaxiKj0TSolCchQtT/Ug7vERJgnd0XNgVlLJdPjqIyQA+
 jj6lrcCpzuiKst989cj9RnqQZeg+uTE48gaAt3Yrp/5boPB/+BwM8vllt8nszZdyMnCHbc9AvI5
 Pm2gIdvafQmJhCu4OnRIDGQWy6QueOlTfAu7vs4TH6OO6xNNicU8OsYPznMTQLdMPrJsgvbfUt9
 wiqMTSI/SIecujQGzHtOZJDzoDa0BXqwDuUWh/vYkRxD29aMmX+Fz6Trr7SFqpimffPAmGMkq22
 Mh0pHsuEjkUVYvstB4g==
X-Proofpoint-ORIG-GUID: VyzmCRmeuPS3E_4qdupU-OTXwenikP91
X-Authority-Analysis: v=2.4 cv=AfwkjHXG c=1 sm=1 tr=0 ts=6aa428d8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=bojYN2d7do4Fjgb3VzcA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110226

On Fri, Sep 11, 2026 at 06:54:34AM +0200, Manivannan Sadhasivam wrote:
> On Thu, Sep 10, 2026 at 08:36:38PM +0530, Mukesh Ojha wrote:
> > The proxy power domain enable path requests INT_MAX performance
> > state for every proxy PD. On Hawi, the NSP proxy power domain's
> > RPMH power domain has no OPP at INT_MAX, while CX and MXC accept
> > INT_MAX, mapping to their maximum supported level.
> > 
> > Introduce a proxy_pd_performance_states array in qcom_pas_data
> > to allow per-PD RPMH levels to be declared explicitly. Platforms
> > that omit this field retain the existing INT_MAX behaviour.
> > 
> > Add Hawi CDSP remoteproc support with the following proxy PD
> > performance states:
> > 
> >   CX:  RPMH_REGULATOR_LEVEL_TURBO
> >   MXC: RPMH_REGULATOR_LEVEL_TURBO
> >   NSP: RPMH_REGULATOR_LEVEL_NOM
> > 
> > Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > Tested-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/remoteproc/qcom_q6v5_pas.c | 48 +++++++++++++++++++++++++++++-
> >  1 file changed, 47 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > index a005546c265d..96a2436b777d 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > @@ -28,6 +28,7 @@
> >  #include <linux/soc/qcom/mdt_loader.h>
> >  #include <linux/soc/qcom/smem.h>
> >  #include <linux/soc/qcom/smem_state.h>
> > +#include <dt-bindings/power/qcom,rpmhpd.h>
> >  
> >  #include "qcom_common.h"
> >  #include "qcom_pil_info.h"
> > @@ -51,6 +52,8 @@ struct qcom_pas_data {
> >  	bool decrypt_shutdown;
> >  
> >  	char **proxy_pd_names;
> > +	const unsigned int *proxy_pd_performance_states;
> > +	unsigned int num_proxy_pd_performance_states;
> >  
> >  	const char *load_state;
> >  	const char *ssr_name;
> > @@ -79,6 +82,7 @@ struct qcom_pas {
> >  	struct regulator *px_supply;
> >  
> >  	struct device *proxy_pds[3];
> > +	const unsigned int *proxy_pd_performance_states;
> >  
> >  	int proxy_pd_count;
> >  
> > @@ -167,7 +171,12 @@ static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
> >  	int i;
> >  
> >  	for (i = 0; i < pd_count; i++) {
> > -		dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
> > +		unsigned int state = INT_MAX;
> > +
> > +		if (pas->proxy_pd_performance_states)
> > +			state = pas->proxy_pd_performance_states[i];
> > +
> > +		dev_pm_genpd_set_performance_state(pds[i], state);
> >  		ret = pm_runtime_get_sync(pds[i]);
> >  		if (ret < 0) {
> >  			pm_runtime_put_noidle(pds[i]);
> > @@ -873,6 +882,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
> >  	pas->info_name = desc->sysmon_name;
> >  	pas->smem_host_id = desc->smem_host_id;
> >  	pas->decrypt_shutdown = desc->decrypt_shutdown;
> > +	pas->proxy_pd_performance_states = desc->proxy_pd_performance_states;
> >  	pas->region_assign_idx = desc->region_assign_idx;
> >  	pas->region_assign_count = min_t(int, MAX_ASSIGN_COUNT, desc->region_assign_count);
> >  	pas->region_assign_vmid = desc->region_assign_vmid;
> > @@ -908,6 +918,14 @@ static int qcom_pas_probe(struct platform_device *pdev)
> >  		goto unassign_mem;
> >  	pas->proxy_pd_count = ret;
> >  
> > +	if (WARN(desc->proxy_pd_performance_states &&
> 
> Do you really need WARN() here, and not dev_warn()? WARN() may cause panic on
> systems that use 'panic_on_warn' cmdline param. In mobile/IoT world, use of this
> cmdline params is not common, but I strongly suggest we scrutinize the use of
> WARN*() macros in new code.

Is it not panic_on_warn for the development environment?  However, I
don't see a problem in replacing it with dev_warn().

-- 
-Mukesh Ojha
