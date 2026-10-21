Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572793;
	b=ReX2ANkHsb8BHoMqzzFGa9lxwjjpU8xfmyLZpO+IUgr34nXr8E3fRF3S9aWAfyuXQYI4
	 dT9XrDcnMlPQH1l1ym++PmnLCU3iCGtOI6rfeAdnUzys63PWsDacTbekAEoIekqTwVwQt
	 b9Tz+Tj7+sO3dUAjjyrWFhtxbxcVtgriBsCjkfJryLT2/28Bv2CrvgDzOkwU07gjRm+ug
	 yWEdlnvD16ejyH1yG95na01pKuxcF93p5EHXwX+qCnCH33Fo50bQcNqokarjvg1e7extR
	 lSWV4+PP1vIhwhiDYD6UUVidTYV2uF0Gf7m1m4uXgpHt9U0j4YW0iY9myit7j6Q40Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=iPMD+7nAdoDF4dLXoWfSbpzZ6Oz4vyFuN1XIGNi1WO0=;
	b=D7IOe2hUEDqBHnT65LuOAXqkwT+MU5Ibwou/alik5ejVEbz40ZyL85YZAbjy7Ss0PxKr
	 pqbvqPLuSaZSUwuUYyv9jI5kSuKlPDmasBrS20gSmKUs0V+e6q4MtCIhZN/KeQja62egE
	 ZrMEDhuP0EORI7JDH3gVyy5kF5vR+PNsCZwzEnGxMvmAW+QLSqOml+y7mRc6DsDxfVQ8n
	 ZnVm8PA+I19u4Mc86c4IqTtclwoqKEKBgfth4PkH1hoZGxxyHtGg2+fIA5nzx676A+15R
	 FB3pPuJwEK12+jCulYBrnC4FELv+S1LUCmFlewk4JJS5JFK22dkCzdIjqjrDT46XDpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hDi1fTr9;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFCD606A31A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABFCD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hDi1fTr9
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso2177355e9.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 01:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792572791; x=1793177591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iPMD+7nAdoDF4dLXoWfSbpzZ6Oz4vyFuN1XIGNi1WO0=;
        b=hDi1fTr9i+zE0FEJtCLU4Tve8JY8Q4EM5sjz/3gmc0wUthILHp0sp6WCAPNT5wsnY0
         fkBaSADTLdFFSW+7GisT1JSX7sdNuTdc3sd0Uc2HpgL56OMmgYaEiJzkiDP6EaSrED7X
         S3/UlS9MOg71A4PkvOkkalBn5ivg2gBBZp088nEBQb0Se/kJjYkep2MH9KYtTZjzeDHu
         OgyYfBuRqtlMIu79eb6UZnlUGCzcLY2a9wE5tbB32PTSrmWvW6ncd5Kpa7p0I4JAM4FN
         DyWOWCKoBWeTcClYDNRrBmqNLYOVZbHoXVO7pLkZKzKLAiZuebtTorrdWB/ThGTrys2m
         Q0+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572791; x=1793177591;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iPMD+7nAdoDF4dLXoWfSbpzZ6Oz4vyFuN1XIGNi1WO0=;
        b=Oea+T9BqYifFrV6/ft0I72uVz++upz3ICZps9yCCLN+fhOhpGEWU9y0C4l8dnIMAZ5
         PzkIvFyYdO9q95ZsIILFXQssnT+ao5cpimdY6owClNUrQ8ggixP6g7MN8osr0sLnIxn6
         GZURSP/5p7HJRTPllMmZFP6FzaSb0pQMIbVee/nmwUyQOxq725haiT10OuyYnBlRaZPQ
         T1a2WHKkVF7csC0aEKFb6VHLrMZbFThCyISCfdeD5REBp/SWSp9BP2XtqlSOdPlZbUPe
         WztpxN+S6f/Pn1Jb4QuuVjJ6E1LdAMW0bgCgOCvUD3vDvdXvXFb3P3mZrjNzqwQ6+ROc
         0aXw==
X-Forwarded-Encrypted: i=1; AKwUvBzllkCBxuch/b29UoAMWKW2vqE2ZdQgc49rIievQPHMi/rLOro0QyXCqbE/gx5dwK0M4vwH7iUY+o2b@vger.kernel.org
X-Gm-Message-State: AFq9FYKC1dYkNsg6ypELXjUCqaVI+NZhOa91FIGFd1jp+GOAY4MtKx7y
	4OCn9As7+d9725SJCgUVvzIv3z1gwLTgSpehoez/YxabHqDT+Sse9XHBfV5u4a/LUaA=
X-Gm-Gg: AYBFou3Aie7JA1VkCw7KEEBpVEr2P/O6IlnZMYV2E7VsqMYFeFBHOEaWfX5TVbLw20H
	nuwY/pSQftVlpXY+tgCNp7RBJD4rJPAneb9ftbaqgRIpJVzz9GszHbReZMuUIRLJvFig76KJp6i
	zDMCcBr+mDnf/Z3tc+4fMPpSLxCTEbB3sgW0+mJlXMerLws5t5Cz+YqWoU1fmoCwsDUoxyPWwAa
	xnTKX2nyX4cQkHueHJjSg2+W5UwoRH3gL1SSsfr96G73arny5wu7+1Fue5ue/1S5L9nGsensi+O
	7+QRJnWTa2Ts4WVIzoIz0SmPZxR6+u4HubeuDcc3dJehMz1KaVt46rqEsKnTIWqr97CCRsxgH1h
	cE6whLOghDWMQY8mOug4sNhDekMw73odv9336c2y2nLuu4dJCxpijVXuHfqyxTiRQBvmXMs9/Xk
	+mFP/BZrHqBXrnFieijf8w41BWtgyMpBscQIkLLNEHkOC8//2vuN8n0Li7UGZeyAOHJISMXcwbc
	Xrpy5HNzt7IbMppnY65V9fOuoIFf8mkYPfqaXRbx84rDR/uU6sUzq54cJ0yXXbjl/l6YA==
X-Received: by 2002:a05:600c:800e:b0:4a1:cedc:ab51 with SMTP id 5b1f17b1804b1-4a1fdd3a79fmr31334015e9.35.1792572790953;
        Wed, 21 Oct 2026 01:53:10 -0700 (PDT)
Received: from [192.168.0.167] ([78.152.223.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a20049941dsm14290625e9.11.2026.10.21.01.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:53:10 -0700 (PDT)
Message-ID: <dbde0e35-8246-4f69-b3be-cd617a1767d9@linaro.org>
Date: Wed, 21 Oct 2026 09:53:08 +0100
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
Subject: Re: [PATCH v21 04/14] media: qcom: camss: Issue stream-on REG_UPDATE
 from CSID
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-4-04fd28d815c6@oss.qualcomm.com>
 <3843110c-4766-4352-ab2a-6d3017336534@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <3843110c-4766-4352-ab2a-6d3017336534@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/10/2026 08:37, Wenmeng Liu wrote:
> 
> Hi Bryan, Hangxiang,
> 
> On 10/12/2026 2:45 PM, Hangxiang Ma wrote:
>> On stream-on, CAMSS starts the subdevices upstream from the video node
>> through their sink pads, so the VFE is started before the CSID.
>>
>> Starting with CSID 680, the REG_UPDATE is issued through the CSID
>> rather than the VFE. However, vfe_enable_output_v2() still issues a
>> REG_UPDATE after queueing each initial buffer, before the CSID has
>> configured the stream. The VFE then never signals BUF_DONE. Therefore,
>> the CAMSS now issues the REG_UPDATE from configure_stream() on CSID 680
>> and CSID Gen3 instead. The operation happens after the RX configuration
>> and before the RDI path is enabled.
>>
>> Skip the VFE-side stream-on REG_UPDATE only when the CSID connected to
>> the VFE sink pad implements the reg_update callback. Platforms whose
>> CSID does not provide this callback, as well as lines fed by ISPIF,
>> keep the existing VFE-side REG_UPDATE.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/camss/camss-csid-680.c |  3 ++
>>   .../media/platform/qcom/camss/camss-csid-gen3.c    |  3 ++
>>   drivers/media/platform/qcom/camss/camss-vfe.c      | 37 ++++++++++++ 
>> +++++++++-
>>   3 files changed, 42 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/ 
>> drivers/media/platform/qcom/camss/camss-csid-680.c
>> index 345a67c8fb94..556cdfef6207 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
>> @@ -296,6 +296,8 @@ static void __csid_configure_rdi_stream(struct 
>> csid_device *csid, u8 enable, u8
>>       writel(val, csid->base + CSID_RDI_CFG0(port));
>>   }
>> +static void csid_subdev_reg_update(struct csid_device *csid, int 
>> port_id, bool is_clear);
>> +
>>   static void csid_configure_stream(struct csid_device *csid, u8 enable)
>>   {
>>       int i;
>> @@ -307,6 +309,7 @@ static void csid_configure_stream(struct 
>> csid_device *csid, u8 enable)
>>           if (csid->phy.en_vc & BIT(i)) {
>>               __csid_configure_rdi_stream(csid, enable, i, 0);
>>               __csid_configure_rx(csid, &csid->phy, 0);
>> +            csid_subdev_reg_update(csid, i, false);
>>               __csid_ctrl_rdi(csid, enable, i);
>>           }
>>       }
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/ 
>> drivers/media/platform/qcom/camss/camss-csid-gen3.c
>> index 0fdbf75fb27d..830c9c818d3d 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
>> @@ -219,6 +219,8 @@ static void __csid_configure_rdi_stream(struct 
>> csid_device *csid, u8 enable, u8
>>       writel(val, csid->base + CSID_RDI_CFG0(port));
>>   }
>> +static void csid_subdev_reg_update(struct csid_device *csid, int 
>> port_id, bool is_clear);
>> +
>>   static void csid_configure_stream(struct csid_device *csid, u8 enable)
>>   {
>>       u8 i;
>> @@ -230,6 +232,7 @@ static void csid_configure_stream(struct 
>> csid_device *csid, u8 enable)
>>           if (csid->phy.en_vc & BIT(i)) {
>>               __csid_configure_rdi_stream(csid, enable, i, 0);
>>               __csid_configure_rx(csid, &csid->phy, 0);
>> +            csid_subdev_reg_update(csid, i, false);
>>               __csid_ctrl_rdi(csid, enable, i);
>>           }
>>   }
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/ 
>> media/platform/qcom/camss/camss-vfe.c
>> index 2680a9914765..16a0b5663fe2 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>> @@ -502,6 +502,37 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
>>       spin_unlock_irqrestore(&vfe->output_lock, flags);
>>   }
>> +/*
>> + * vfe_upstream_csid_has_reg_update - Check whether the CSID feeding 
>> this line
>> + * issues its own streamon RUP (i.e. its configure_stream does the RUP).
>> + *
>> + * The CSID->VFE link is created in camss.c for all CSIDs and VFEs, 
>> so the
>> + * upstream entity of the sink pad is either a CSID (possibly with 
>> RUP) or an
>> + * ISPIF (no RUP). Only enabled links are considered.
>> + */
>> +static bool vfe_upstream_csid_has_reg_update(struct vfe_line *line)
>> +{
>> +    struct vfe_device *vfe = to_vfe(line);
>> +    struct camss *camss = vfe->camss;
>> +    struct media_pad *remote;
>> +    unsigned int i;
>> +
>> +    remote = media_pad_remote_pad_first(&line->pads[MSM_VFE_PAD_SINK]);
>> +    if (!remote || !is_media_entity_v4l2_subdev(remote->entity))
>> +        return false;
>> +
>> +    for (i = 0; i < camss->res->csid_num; i++) {
>> +        struct csid_device *csid = &camss->csid[i];
>> +
>> +        if (&csid->subdev.entity != remote->entity)
>> +            continue;
>> +
>> +        return !!csid->res->hw_ops->reg_update;
>> +    }
>> +
>> +    return false;
>> +}
>> +
>>   int vfe_enable_output_v2(struct vfe_line *line)
>>   {
>>       struct vfe_device *vfe = to_vfe(line);
>> @@ -511,6 +542,7 @@ int vfe_enable_output_v2(struct vfe_line *line)
>>       unsigned long flags;
>>       unsigned int frame_skip = 0;
>>       unsigned int i;
>> +    bool rup_in_csid;
>>       sensor_pad = camss_find_sensor_pad(&line->subdev.entity);
>>       if (sensor_pad) {
>> @@ -523,6 +555,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
>>               frame_skip = VFE_FRAME_DROP_VAL - 1;
>>       }
>> +    rup_in_csid = vfe_upstream_csid_has_reg_update(line);
>> +
>>       spin_lock_irqsave(&vfe->output_lock, flags);
>>       ops->reg_update_clear(vfe, line->id);
>> @@ -552,7 +586,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
>>           output->gen2.active_num++;
>>           ops->vfe_wm_update(vfe, output->wm_idx[0],
>>                      output->buf[i]->addr[0], line);
>> -        ops->reg_update(vfe, line->id);
>> +        if (!rup_in_csid)
>> +            ops->reg_update(vfe, line->id);
>>       }
>>       spin_unlock_irqrestore(&vfe->output_lock, flags);
>>
> 
> According to the hardware documentation:
> Starting with CSID 680, CAMIF has moved into the CSID. As a result, RUP 
> is now issued by the CSID and propagated to the IFE.
> 
> Starting with CSID 980, software must also set the SET bit in 
> RUP_AUP_CMD after issuing the RUP/AUP command. Otherwise, the hardware 
> ignores the command and the corresponding register update does not take 
> effect.
> 
> 
> Bryan, according to the HW documentation, the change itself is 
> consistent with the required programming sequence. The main question is 
> whether this is the right implementation from the driver perspective, or 
> if there is a cleaner way to handle it.
> 
> I have tested the change on the Hamoa EVK board.
> Tested-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com> # Hamoa EVK
> 
> 
> Thanks,
> Wenmeng

OK thank you for the explanation.

OTOH I agree with Loic's statement - it is cleaner to subtract the 
callback and disjunct on its presence than to add a flag to the same 
effect in reverse.

---
bod
