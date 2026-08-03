Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DF643230F
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 18:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785782263; cv=none; b=IgSwn9YDpz8dn9Yi0OgSfD6rsF/ckd5hcJx1zt9ZHTazlYR245+LCnDDuKK22v4crGWFOzcKAWKtX7uxKkpH6p8HQE5rfevU4AVRqI9o+RlIuEdCdooZQTAf1UzClLCPYqqYkdAm+2wu6WpxVdW5haBijVvp7PN3v6Oo9UPZlH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785782263; c=relaxed/simple;
	bh=aMvYJsvgQGt1hsKgdZ1g6TxBoqxAqrHlzxqmA7g2iPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oysBk5Pjls4FkM/xkW9hgxOWxFBBqkzXH963v87ANkQsiQenJZ9hPx5e1FWtn5S6WRNDAUcNuOiqjYBScaAkexzAZJcS/IyxqxsUwl5dC/LncU7IcI5srCUO/M4ZAtuOgIZhPpVP1IZ11dj7o3IbhRGsdiIlOZtAs3108cyZqrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eZrKRV87; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RJ361Ert; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eZrKRV87";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RJ361Ert"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673Gvtqs973783
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 18:37:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hIP9IRTQDlp4agva/gLK4c0w6ETu1nA/RCtshOXlPNY=; b=eZrKRV87v/MLtCWb
	StOuC/BYF7oeLzyO7NdiGGshs3xH1mpVzo1MnRpP4gw9SLoLpciBrmp+zl0IPQ+t
	89AnmlbrQoFtnMZWG6O6TsAalFsA8pyHYRbehVsaULkX2NW2zTXztXL7YSJUoUaD
	3JCp1degubj8T0TmAtClYYCXDqPu9HDmJThNtt9wzAsQb9nJLhC00EQkYf2Vj7ZF
	VAF7sDaM5YAcQvSzjkomrQ15h3bsTC7NYy/c43Xj/xVm9ohClj+qC3N4ymLl/zUS
	NL16fx78/5fG4IGupbMFtg7Egsd+flAEkwqI6Uuskvb5YM2lgPJeJeiW5YNokp9R
	k8csJg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhb36th-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 18:37:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5276aa86d00so38600581cf.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 11:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785782255; x=1786387055; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hIP9IRTQDlp4agva/gLK4c0w6ETu1nA/RCtshOXlPNY=;
        b=RJ361ErtW5iXKms6F4VkOcMeDljcNtPKEElY1EPwEVlA/k/Z4F0qzECBw9F+1iltU3
         KgBx20ZOh4AgRq15LCYif6rF8EKbu0DaAGo4B6xhBtSLKdtih/Yat7dIMrb3Kc1PvpBY
         SOLclw4F0bS47ZdBjpcgBdXT1uVpgUUCGBQLTqUg1DLpqWzs/yeHe1EdV2+oLac334jW
         Eexo2FSTnRgHqBdfxVA6wbd1ZyyYEuRagdbwXgDa99z5MWFjpgEPWLLve5ijDFYZmQ2C
         bdkEILGhpzhp6DLB5/PWzMbn6iCPbrASEs1z3QH4yJ+6QKF6ZxC+5D2DwHUUG4CqFwYU
         Uizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785782255; x=1786387055;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hIP9IRTQDlp4agva/gLK4c0w6ETu1nA/RCtshOXlPNY=;
        b=EN2Un+VEfMwm9WSSHAsD6Vi/pEijOI9Ml8HjeWWxg99zz/trjrJlwgmmscEv54eDo1
         fI6/EbzoUji7q+mQN3h8ae/7IQq5lIxKQ7Z0o65Nhg4p86GiRSCNCuR6Qi6r1VoiBBHg
         910LkQxHPVSDmcolZMVNLe6F6iYmI/6mDFjglrUKPSGa7giZNVhIPoNfhLQ6abh5clEt
         ZxHDDgvhQUId11UpQseLfMTpygY9fIOb7YQNxevA3nVOwHhV9E8d2UOAyLgLlOhbO6+b
         zcbFTTxU0o4kNwQKgu21RZvD/yiMtFgvQ2A7JvvS3EtnRMg3rJgjTxmfN0iGYyaKsWon
         WvBg==
X-Forwarded-Encrypted: i=1; AHgh+RrfHMMKflU6GE67yUxmIIbL/3SMZVsQzhz8ol2o30wmGPyH6UBK+QieIxMYYNoJTKEMn72hsLztA4dB@vger.kernel.org
X-Gm-Message-State: AOJu0Yze4j354lbnwZXWxLZNTAVetV0Wl0AIUWsoZUdk1o5Sud0HmcVy
	r+DyNn7QkGQUMiGx7XkfmHv+kszpoPELbZRJBeVgeen4pz/0fydmStvzBaQXA4vBVwIzNbrWG9a
	7tMgrsff/Tkumxrsfb4opm+vFZ1+ODcwkimuq/eOQ6Kq/Scm/eWmgHUVzmH2/duAo
X-Gm-Gg: AR+sD11VSymwghc7oxrfoZqJvz36DmD+wc+U9f/hf0M+ZMQEuABuRT59G7lFngDIPj/
	z02gyGxkjEQVroljBCgNS3L47YujIomgLh5fvHUHx0KsmFSAxcU3onYvV0h7dhAGBccxz1QmvF4
	Hoyr8Y5odIoSqU+m8rs+aSw5YvuJSNrGfSuXVoflT1R39/s7vlfyKWRHp/S/l4hETGoCittr/D6
	T5m7PPJOL3vn3Xl2ELb1LNc1FIEa7FwipHBIz/vFbZ/Twa+hJzptSAwIC47IEueZaTtcUfpJif/
	ot0JHmdu7JdIWHwE2sYTjQA8UdXNtguVh2r67ARBTRPCsj9Vwj7ATozotDHLooQoIYea0Zpqp2H
	sdwr/nOQAEVMUXuWSjV4yAWySltTCGbH7sGaFbYuqBJ+Ui9F6oqD/7n4mDUDhtRwd6c0v2BhaIp
	5P8eitL/PYMBBAtg==
X-Received: by 2002:a05:622a:1247:b0:51c:844f:28da with SMTP id d75a77b69052e-52b56673bf2mr250409781cf.5.1785782255299;
        Mon, 03 Aug 2026 11:37:35 -0700 (PDT)
X-Received: by 2002:a05:622a:1247:b0:51c:844f:28da with SMTP id d75a77b69052e-52b56673bf2mr250409101cf.5.1785782254764;
        Mon, 03 Aug 2026 11:37:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f812e310dsm15855291fa.30.2026.08.03.11.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:37:32 -0700 (PDT)
Date: Mon, 3 Aug 2026 21:37:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/3] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
Message-ID: <h7e5t6rqvrlogj4li4incr2pog57dfal23rqo326vi2cz4zpxl@m7orpk6dftty>
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-3-atanas.filipov@oss.qualcomm.com>
 <vz6a2qugu7kkci3fcdkd236axr3ur33ghrgoopbrz3isueml45@b4frwo4l2hfh>
 <3f40cde3-a4bd-424d-be42-60915c90e6c3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f40cde3-a4bd-424d-be42-60915c90e6c3@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: x1QLWtu9OpMitP3cWzVhaw84Z3U9jVKH
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE2NSBTYWx0ZWRfX5aCRz9f7vCVX
 ZWjFIFakgElPvE+gWcyCbSA8U97qGmNRb65r6zG+zvjc6erqa9s0H6tPOFby6J9TbeCN/voaJpb
 06dEL1Z30hiVSJs4dOIgVx2S1OjhIOA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE2NSBTYWx0ZWRfX7sgFzPcLT9dA
 UCEG6yrvOq5bKBHARc99fmjA3/8yXMqFvzYhdUNPGzjmewyu3OpuB8V1pxNO7JVdze27xsVu3wa
 D3P4tSLKdkh5nrPgNJzbGIsM2xRUO3wopX3b6C42CsOjIYYToCsITeutCisg/zi411qgsini5Qb
 6ktoxPxNqN2RgEjfCwWEWj/NFYFMKIG+Bo8GT/92sgdgBe9qXCYalIkhUWyhW28dL9iuxWfAeMO
 eihrY9PkJr1OeC7deVuPNuG0BSBoDulIG5cfCZPrxj4aO6GyPNUacOUJQnSzowgdOI+VcLSGxy9
 3INqsdRQSDeVIYNz3yafQ0k45sa/yRjhdfWCBZhk7E7buwHXZrfq9AMSA5Zu46Oq1SSgNV2hBBu
 maX2PC2bfIoQTFpTBkmgVBoZar4QYjNYehHqC3b/XuiBoshzPC5vWICmcN9A6e/yIKJq8Og4oTC
 +ukIoGenrTUQgVtk1JA==
X-Proofpoint-GUID: x1QLWtu9OpMitP3cWzVhaw84Z3U9jVKH
X-Authority-Analysis: v=2.4 cv=bKEm5v+Z c=1 sm=1 tr=0 ts=6a70dff5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=PdqdRH78fHWJp5eU5_0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030165

On Mon, Aug 03, 2026 at 06:57:09PM +0300, Gjorgji Rosikopulos (Consultant) wrote:
> Hi Dmitry, 
> 
> On 7/30/2026 6:57 PM, Dmitry Baryshkov wrote:
> > On Thu, Jul 30, 2026 at 06:05:23PM +0300, Atanas Filipov wrote:
> >> Add a Qualcomm JPEG encoder driver implemented on top of the
> >> V4L2 mem2mem framework.
> >>
> >> The driver wires vb2 queue handling, format negotiation, JPEG header
> >> handling, interrupt-driven job completion, and runtime PM/clock/ICC
> >> integration for the standalone JPEG encode hardware block.
> >>
> 
> <snip>
> 
> >> + */
> >> +
> >> +#define JFIF_HEADER_WIDTH_OFFS		0x07
> >> +#define JFIF_HEADER_HEIGHT_OFFS		0x05
> > 
> > And you've ignored feedback here. PLEASE move all standard-related
> > defines and code to the common helpers. Are there any other drivers
> > which construct JPEG files manually? If not, you are lucky and you can
> > just push you code. If they are, find a way to unify the codebase.
> > 
> > At the very least, it would make you split this commit into at least
> > two, making them more readable.
> 
> Yes, this comment was incorporated, maybe partially, or it wasn't fully understood.
> The helper is used for the quantization tables and wherever helpers are available, 
> similar to other drivers: hantro_jpeg.c, e5010-jpeg-enc.c.
> 
> The missing JFIF tags and additional helpers can certainly be added,
> but is holding up the current driver just for that a reasonable ask? 
> This discussion may continue for a long time — is it reasonable to wait that long?

From my point of view, yes. From your comment it feels like each driver
having their own way of wriing JPEG framings.

> 
> I agree it would be good to have all other upstream JPEG encoder drivers move to shared helpers,
> but the effort isn't uniform across them. 
> 
> Five drivers — hantro_jpeg.c, mxc-jpeg.c, rcar_jpu.c, gspca/jpeg.h, and solo6x10-jpeg.h,
> build a fixed byte-array template and patch width/height/table values at hardcoded offsets, 
> so they could plausibly migrate to a shared builder with a similar shape to what we're proposing. 

Can we start with something as simple as this for our driver too?

Then you can converge all these drivers to use those simple helpers
(this should not require the actual hardware to test), then improve the
helpers.

> The other two, e5010-jpeg-enc.c and coda-jpeg.c, use incremental byte-by-byte writers instead, 
> so their migration would look quite different and isn't a drop-in fit for the same API.

Ok, these are more difficult cases.

> 
> Either way, we don't have access to most of these devices and can't verify the changes ourselves, 
> so migrating them is not a simple effort to undertake as part of this series.

Which reads: "we already have 7 different implementations of JPEG
framing / file format, can we add 8th?" The typical answer would be
"no".

> 
> > 
> >> +#define JFIF_APP0_LENGTH_HI		0x00
> >> +#define JFIF_APP0_LENGTH_LO		0x10
> 
> <snip>
> 
> >> +#include "qcom_jenc_dev.h"
> >> +
> >> +/*
> >> + * JENC encoder hardware operations.
> >> + */
> >> +struct qcom_jpeg_hw_ops {
> >> +	void (*hw_get_cap)
> >> +		(struct qcom_jenc_dev *jenc_dev, u32 *hw_caps);
> >> +
> >> +	int (*hw_acquire)
> >> +		(struct jenc_context *ectx, struct vb2_queue *queue);
> >> +
> >> +	int (*hw_release)
> >> +		(struct jenc_context *ectx, struct vb2_queue *queue);
> >> +
> >> +	int (*hw_prepare)
> >> +		(struct qcom_jenc_dev *jenc);
> >> +
> >> +	struct qcom_jenc_queue * (*get_queue)
> >> +		(struct jenc_context *ectx, enum qcom_enc_qid id);
> >> +
> >> +	int (*queue_setup)
> >> +		(struct jenc_context *ectx, enum qcom_enc_qid id);
> >> +
> >> +	int (*src_fmt_update)
> >> +		(struct jenc_context *ectx, u32 old_fourcc, u32 new_fourcc);
> >> +
> >> +	int (*buf_prepare)
> >> +		(struct jenc_context *ectx, struct vb2_buffer *vb2);
> >> +
> >> +	int (*process_exec)
> >> +		(struct qcom_jenc_dev *jenc, struct jenc_context *ectx, struct vb2_buffer *vb2);
> >> +
> >> +	irqreturn_t (*hw_irq_top)(int irq_num, void *data);
> >> +	irqreturn_t (*hw_irq_bot)(int irq_num, void *data);
> > 
> > How many non-default platforms do you support? Zero?
> > 
> > Drop the call table.
> 
> There is plan to add support for more platforms, if the preference is to remove platform based ops now,
> and introduce them when new platform is added i am ok with that. But will require more work now and
> for the new platform...

Yes. When you add a platform, we (reviewers) can see, what exactly is
required for that platform. For now, you are adding complexity for no
added value.

> >> +
> >> +/*
> >> + * V4L2_CID_QCOM_JPEG_PERF_LEVEL_AUTO - enable adaptive performance scaling.
> >> + *
> >> + * When set to 1 the driver selects the core clock OPP level based on the
> >> + * encoded frame resolution and fps target. When set to 0 (default) the
> >> + * driver always runs at NOMINAL (highest) OPP level.
> >> + */
> >> +#define V4L2_CID_QCOM_JPEG_PERF_LEVEL_AUTO	(V4L2_CID_USER_QCOM_JENC_BASE + 0)
> >> +
> >> +/*
> >> + * V4L2_CID_QCOM_JPEG_FPS_TARGET - target encode rate in frames per second.
> >> + *
> >> + * Used together with V4L2_CID_QCOM_JPEG_PERF_LEVEL_AUTO to select the lowest
> >> + * OPP level whose throughput is sufficient for the requested frame rate.
> >> + * Has no effect when perf_level_auto is 0. Range: 1-240, default: 30.
> > 
> > I assume 1-240 is only applicable to your driver.
> > 
> I think we can drop those controls and use s_param on output(source) video node as it
> was done for some of the other m2m drivers including OPE. Which make sense we tell the
> the driver at what rate source buffers will be received, then the driver will choose op
> level to satisfy that requirement.

Ok (if you say that there are other m2m drivers doing this).

-- 
With best wishes
Dmitry
