Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE7E448B8E
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 08:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791447105; cv=pass; b=sFLV/knVTEvNcR4OBhpo6+DR4W84J84SGz8hLaxE+dJN78KIkHRO7yavtbht50aX+Piud8cX09P6pHDBwFjsv/OqHOPcdJuVgS2pGPF6zFfGfEn2MR82KPko93rh3y82PuOHo8UAP/dqSxcnP2bCnWCfxhrn8jYqKsr/z9F1QeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791447105; c=relaxed/simple;
	bh=D7UiphtT6EBwO/k/ikf2NWjb/RYMvUOnxloV2AvhWw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LLdveXQC3qTXGYIJqlD1+MNPbDsCE3C1pEDT6rujsQ6IDaUhXvemH36w3FxUa0qwWH8MeAE5KNHyZeQ6rMGpPmUpoXwp3wsRWgHuHWS0Afi/GhWB4Sh/Qv92QH42cpzGgA1gyKENxBdv81ecYOt8rUEafW1ZWyWcbeIdUaFkxqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvENMn6W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cPuJfmAl; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvENMn6W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cPuJfmAl"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KQBC3308488
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 08:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JItcqZCTTZ5Tr3DrlkTjE4P6dQhLoTOAQJPbjV6HDlQ=; b=lvENMn6WoMDZJeJH
	01RdZR9gO8z+f/cXd2he/jnQUB2R8Xqeb3nw4iaPPwOttG3a26yJqZCpdD3uhOsG
	9dv454H28YeDbtIDbJNw6vmfZe4Pp5/SWvOyXQv2DddRCN/p72q60CHRngiL0nm0
	HB7i3KeAdrgd16ZFXWONK4Hegqyx/Y7hBTujduBGtoQ+dcdHkZDg1pfJ5EOtEV2W
	4j/FDmq0kxszm3QUrral1g168QvpxlWcIOeqN0QaNOVDJnoEii9Q+ZI7XqOIN/XR
	xK8GVS0+tg/72OYeqfInTymZIClV2yHOpJiJyt5ruO+0LNj3iymWfDmUjuakz/3j
	Scwa8g==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sg9e90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 08:11:42 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-6768c955661so4896874d50.3
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 01:11:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791447101; cv=none;
        d=google.com; s=arc-20260327;
        b=E4/jvWt1Vol7PTJ3QSseA2IYY695d909+J79//5oI3wTANmYOkDG0oqszctPNAYZ/r
         MQyMkNLvLJgLmsKmtpvVn/Vl7nks4TD90n2AnpueTOGsnWFeG2q4SIh2OkEIHvgTpl3Y
         wwcybrOtiECRLAr+YeK3Lb+jeNEyCUx3vvYjpFTQx6LfLOZTbfAbhIcN6Bucvef0ffL0
         bQF/HbWPqZmz0fIXIwTj2QHUwcYjRv0CreQKv5fyHRgYwIwDRFJ9PZW9czRiXlitXFYH
         GpH4N/mSCS71qqK7vpMNpkox44fN3+6Vor+dRxj0H2sPJDJiXMvF8n2NofyDhpE/EEW4
         gzmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JItcqZCTTZ5Tr3DrlkTjE4P6dQhLoTOAQJPbjV6HDlQ=;
        fh=TudL+lf9swebHLCIx5Q8UBD/bPBl93gW/0h/prVrhHo=;
        b=ILxZ+M+L2DmUTzteh4fXeCxXhI9okyNpB+sLeTZ6vtwL76piCL643Nrh9Qx1yr0YTV
         l2uI82Brpg3beGZLAy8+jqutJZQGeJOTZgArigv/YYetcGhDRLvmB2sgL1o3D82HUbGV
         cHizFd7oITftlGJa1r6rjKOhQZv+7Q33y95lR/+2i4lnlNkxGHCaRY7SFfN9umVTPhpU
         IT73SvAfQW+xYAo6Hvf9AC3AtF8BRJYYgtCrDz7X6w2Jsve80M+Is0YkJOJiVGEnwqSQ
         ABnsVrEmAaYDqAUvLd5ZkrqLkgjXT7suQeSgk18X9UthRxQmN2RExpX2AAR4wwS8gzCs
         lEgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791447101; x=1792051901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JItcqZCTTZ5Tr3DrlkTjE4P6dQhLoTOAQJPbjV6HDlQ=;
        b=cPuJfmAlDmRAR0o23MONYD5SHbwg6aqDhkseWn/Z21fLItX+/VzVMFtNtFzh/tgyAV
         9hrcMuUq2xQCUgjfBgX2fzFT1VDHEqxuQ6KBTCQuBSO8izCN2o2r6Rf+PVnUHxCosbzn
         v6TH1b98DKkzcbP9cxbLR5FuqC0GD2E/uTe0MgdoUZWp7pvMo+8dHqm9GrCn7fmV3cYh
         ZVUDgRtSsoWNitYQ9VRcv/PT3S0jBrstOUwO+k4IhPMhSzfKJqlWoK9bORCnu5Z/1OPf
         y7S9pmgAf45Icb3DAoedMxYLhjt+wDP+rUqASy7AZi5W8f06XjOJaV3eKF3LpfriHi8a
         aZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791447101; x=1792051901;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JItcqZCTTZ5Tr3DrlkTjE4P6dQhLoTOAQJPbjV6HDlQ=;
        b=enZm4kXZ6ZxpWmGZOsVyeUNFwccxNrJQXamgqbJCDb5nurwJUd8jFM3ngtXmixt2jR
         kEz21K3izE8JrHPJqdLfDNprv4SXoLbVXvtugH9NETKm+So6vLOqrsvnilJ89LoZYrOL
         5nOnFgSOSXTkW13Gw8D8ZPPB/W+Njjx1vtyKq0k93tqZEnvqmK81MNLdWUeElOnWCq3P
         FGkdEaXbaVnO83/tExhmEvRs+gXmCO8x22tWYPtJGjaiaR59IMy79IMk7O4FvPEvPbYb
         bb/imYh30EWWoXKtDEwPHvzHy2EIFjLk/v2Y+NwuDiE/RPbZj8vhxgZ+c1pbC0K8RlZa
         ZsZg==
X-Forwarded-Encrypted: i=1; AKwUvByj4WgjBEFdSg2VBw9Q31We/4WnppHtFDka3aHfifP1CstqmW0lzLa0MOpKWeaSTUAS+LzFkdZJ8GRp@vger.kernel.org
X-Gm-Message-State: AFq9FYKoZDvdhHSZnGKjKkkwZ+JnzsMPBwbgpWVldyEUpeV92LI4FHQS
	i4xOYxo3atA8GqjPxHL6g4q4nUOJSi3/7zkTP/xgUaUQ63COygVMYOH6FfX4dsyq1zEQPbXor53
	SgcJ5AOmWeJGK/oJ9LZFw07xGdEwKMdBR/IP9JQwZOKOEiaH8Ynca7QL/m4dRexb4NxohhWNeOa
	OtAfls8hwMJ5/K6NSroECVfElcoBo4Ng4AVmpn1Wc=
X-Gm-Gg: AYBFou0AfezL7R2gNhxYr+CHQ3GYTwyO84HSlUtW2jttDQWDbpJvyY/lRPpF9SdJkKF
	sJCgwHcmpoxIkzGNmc35mIfBC10nmWWWWq7gGTgRBXGmJfweJlSW3ZMDG2obLSzWEJvLv7o9YbM
	EQ2LEBMKD/7oBHJSwLsjO8of/6dcKkReOQ2Qdabw+QQWESjxnEIacrhIM=
X-Received: by 2002:a05:690e:43d1:b0:677:d251:ccb2 with SMTP id 956f58d0204a3-6790a3ba2b6mr1617783d50.15.1791447101132;
        Thu, 08 Oct 2026 01:11:41 -0700 (PDT)
X-Received: by 2002:a05:690e:43d1:b0:677:d251:ccb2 with SMTP id
 956f58d0204a3-6790a3ba2b6mr1617763d50.15.1791447100494; Thu, 08 Oct 2026
 01:11:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
 <20261005-rpmi-tee-service-grp-dev-v2-6-72f222e23ec1@oss.qualcomm.com>
In-Reply-To: <20261005-rpmi-tee-service-grp-dev-v2-6-72f222e23ec1@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 10:11:29 +0200
X-Gm-Features: AclHuK_ulwLbOdiOwhVLyKYI0w-jUZto9bQrzFykzb9tv-znqnJpL93tMSNQoQQ
Message-ID: <CAGgiveUzBk0Na13cqPRnQw8y2XdQ9LLktFK5eaJLTMiQZJPc_w@mail.gmail.com>
Subject: Re: [PATCH RFC v2 6/8] tee: optee: execute yielding RPMI calls
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: bjwKFwboPg-_3wY_vnQl1yfqZtWzEE0H
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzMiBTYWx0ZWRfXwUkrMXLhVYmv
 Z6P3B5F7YCMt92/ouhK9c0OAO+iVEpVsDXAHiVxTeWaPrjuMSIr0BTt0PI8lc44RwHDVVCAgDr0
 s67IntK/mCQ60nR0mrccezaYiGHkacY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzMiBTYWx0ZWRfX9Hcjv6IV2oWJ
 dyYgtoFL7WUsblY4O+HSpd3Mm/l30L8PJB9YJrzlbsW48cJARatgKGV/7QsdLxjhzhbJgxL/d6I
 06J1N8FCUGyUWbKndKvnupFyckkx7zXJ0HWJ1/1yN5oNePjCexIXgcdYxJxCqz3LdL1P6szrwQZ
 LNMsXyMIFnTlVWWMD2qx3OqHKCeV080LChMl4aBCAXkxfg3tvdRrMPz1iwGFhddudZJjkT+FgKp
 AslDSOfxvt6OR1r0HWxY/GnOVpaJQeVWK+kadHS3KP0TaXzM1eXhwuK2xkOyqFU5BuiZqZBW7f+
 qD/SBdaa2DuDIHzRv+CsD21p/N0lNsgqiRTXylfVwk9xwLgHEJW8fkNuvLvUWgmyfzCF8+zZ96m
 BwKYijpLJU06VBE/OsErHcybSKKz32xDebXaDm6vCPoekFtvJADunb4Vyza0PW6W5xLaGh2Xfz1
 SFenp4eISqT8XweKspA==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac7503e cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=ErwVIQJsGMf6Wn3gpasA:9
 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-ORIG-GUID: bjwKFwboPg-_3wY_vnQl1yfqZtWzEE0H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080032

On Tue, Oct 6, 2026 at 2:40=E2=80=AFAM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> OP-TEE commands can span multiple exchanges with normal world. A call
> may yield to request an RPC service or allow interrupt processing
> before continuing execution in secure world.
>
> Add the RPMI yielding-call path used by the common OP-TEE session
> operations. Submit the command and RPC argument buffers as ranges
> within a shared memory parcel.
>
> Handle RPC requests while the call is suspended and resume execution
> using the token returned by OP-TEE until the command completes.
>
> Use the common OP-TEE call queue to wait when an initial request is
> rejected with RPMI_ERR_BUSY, allowing another active call to complete
> before retrying.
>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  drivers/tee/optee/rpmi_abi.c | 124 +++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 124 insertions(+)
>
> diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
> index 58d82678be98..6e76316794c1 100644
> --- a/drivers/tee/optee/rpmi_abi.c
> +++ b/drivers/tee/optee/rpmi_abi.c
> @@ -9,6 +9,7 @@
>  #include <linux/mailbox/riscv-rpmi-message.h>
>  #include <linux/overflow.h>
>  #include <linux/rpmi_tee.h>
> +#include <linux/sched.h>
>  #include <linux/slab.h>
>  #include <linux/unaligned.h>
>  #include "optee_private.h"
> @@ -560,3 +561,126 @@ static void optee_rpmi_handle_rpc_cmd(struct tee_co=
ntext *ctx,
>                 optee_rpc_cmd(ctx, optee, arg);
>         }
>  }
> +
> +/* Handle RPC command or interrupt returns from a yielding call. */
> +static void optee_rpmi_handle_rpc(struct tee_context *ctx, struct optee =
*optee,
> +                                 u32 result, struct optee_msg_arg *arg)
> +{
> +       switch (result) {
> +       case OPTEE_RPMI_YIELDING_CALL_RETURN_RPC_CMD:
> +               optee_rpmi_handle_rpc_cmd(ctx, optee, arg);
> +               break;
> +       case OPTEE_RPMI_YIELDING_CALL_RETURN_INTERRUPT:
> +               break;
> +       default:
> +               pr_warn("Unknown RPC func 0x%x\n", result);
> +               break;
> +       }
> +}
> +
> +/**
> + * optee_rpmi_yielding_call() - submit and resume a yielding RPMI comman=
d
> + * @ctx: calling context
> + * @req: initial command request
> + * @rpc_arg: shared RPC argument buffer
> + * @system_thread: caller requests TEE system thread support
> + *
> + * Only RPMI_ERR_BUSY rejection of the initial command permits retry.
> + *
> + * Return: zero on completion, or a negative error.
> + */
> +static int optee_rpmi_yielding_call(struct tee_context *ctx,
> +                                   const struct optee_rpmi_call_req *req=
,
> +                                   struct optee_msg_arg *rpc_arg,
> +                                   bool system_thread)
> +{
> +       struct optee *optee =3D tee_get_drvdata(ctx->teedev);
> +       struct optee_rpmi_resume_req resume =3D {
> +               .op =3D cpu_to_le32(OPTEE_RPMI_YIELDING_CALL_RESUME),
> +               /* resume_token is nonzero after OP-TEE suspends the call=
. */
> +               .resume_token =3D 0,

I missed this when reviewing "tee: optee: define the RPMI control and
parcel-reference ABI". I'd prefer if the resume_token was a truly
opaque value, just as for the SMC and FF-A ABIs. Any reason why it's a
64-bit value instead of 32-bit, as is used for the other ABI?

> +       };
> +       struct optee_rpmi_call_resp resp;
> +       struct optee_call_waiter waiter;
> +       u32 result;
> +       s32 status;
> +       int ret;
> +
> +       optee_cq_wait_init(&optee->call_queue, &waiter, system_thread);
> +       while (true) {
> +               if (resume.resume_token)
> +                       ret =3D optee_rpmi_call_with_status(optee, &resum=
e,
> +                                                         sizeof(resume),=
 &resp,
> +                                                         sizeof(resp), &=
status);
> +               else
> +                       ret =3D optee_rpmi_call_with_status(optee, req, s=
izeof(*req),
> +                                                         &resp, sizeof(r=
esp),
> +                                                         &status);

Please fix the too-long lines above.

> +               if (ret)
> +                       goto done;
> +
> +               switch (status) {
> +               case RPMI_SUCCESS:

Any particular reason why we aren't using TEE error codes here?

> +                       break;
> +               case RPMI_ERR_BUSY:
> +                       if (!resume.resume_token) {
> +                               optee_cq_wait_for_completion(&optee->call=
_queue,
> +                                                            &waiter);
> +                               continue;
> +                       }
> +
> +                       fallthrough;
> +               default:
> +                       ret =3D rpmi_to_linux_error(status);
> +                       goto done;
> +               }
> +
> +               result =3D get_unaligned_le32(&resp.result);

Why not le32_to_cpu(resp.result)?

Cheers,
Jens

> +               if (result =3D=3D OPTEE_RPMI_YIELDING_CALL_RETURN_DONE)
> +                       goto done;
> +
> +               cond_resched();
> +               optee_rpmi_handle_rpc(ctx, optee, result, rpc_arg);
> +
> +               resume.resume_token =3D resp.resume_token;
> +       }
> +done:
> +       optee_cq_wait_final(&optee->call_queue, &waiter);
> +
> +       return ret;
> +}
> +
> +/* The caller supplies SHM with room for command and RPC args. */
> +static int optee_rpmi_do_call_with_arg(struct tee_context *ctx,
> +                                      struct tee_shm *shm, u_int offs,
> +                                      bool system_thread)
> +{
> +       struct optee *optee =3D tee_get_drvdata(ctx->teedev);
> +       struct optee_msg_arg *arg, *rpc_arg;
> +       struct optee_rpmi_call_req req;
> +       size_t arg_size, rpc_size, rpc_offset;
> +       u32 parcel_id, nonce;
> +
> +       arg =3D tee_shm_get_va(shm, offs);
> +       if (IS_ERR(arg))
> +               return PTR_ERR(arg);
> +
> +       arg_size =3D OPTEE_MSG_GET_ARG_SIZE(arg->num_params);
> +       rpc_size =3D OPTEE_MSG_GET_ARG_SIZE(optee->rpc_param_count);
> +       rpc_offset =3D offs + arg_size;
> +       rpc_arg =3D tee_shm_get_va(shm, rpc_offset);
> +       if (IS_ERR(rpc_arg))
> +               return PTR_ERR(rpc_arg);
> +
> +       optee_rpmi_shm_get_identity(shm, &parcel_id, &nonce);
> +
> +       req.op =3D cpu_to_le32(OPTEE_RPMI_YIELDING_CALL_WITH_ARG);
> +       req.parcel_id =3D cpu_to_le32(parcel_id);
> +       req.nonce =3D cpu_to_le32(nonce);
> +       req.arg_offset =3D cpu_to_le64((u64)shm->offset + offs);
> +       req.rpc_offset =3D cpu_to_le64((u64)shm->offset + rpc_offset);
> +       req.arg_size =3D cpu_to_le32(arg_size);
> +       req.rpc_size =3D cpu_to_le32(rpc_size);
> +
> +       return optee_rpmi_yielding_call(ctx, &req, rpc_arg, system_thread=
);
> +}
>
> --
> 2.34.1
>
