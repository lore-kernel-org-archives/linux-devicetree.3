Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08FF239E9B
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 22:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791500178; cv=none; b=RgejZRi0N7nRkjsN4KE16DpnY1UOg1C93/gxa2VPeRnCxp1fERREqptVhGwpKeEqRhLPGPQnooLFp9DDkCjUgxUj5DZT4n4T5Nvj9rV4a/GN98ONHMj7RaPJVlSZLcYG2QrqsObRflOKSDFyh4uyPKjqN2iIWdsb/TpAtngAvZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791500178; c=relaxed/simple;
	bh=UeprysSFUyVE4ZYPJKXJLTjE00xRDklP/Q4e0L7Tt7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=il/xYWPyE/Z5g3NwdnmRnxnGcvdfwkPI/fgKNTn9JiBXttcsqX5cOyybOATUCmMIKldjoYE6/AnvEsdtOaGVL5BTH35llrhzA2wYnIDshQ0MkxR9ggrBOQfkRYU7tvPAblyOMHkjGhcbAnzPTyv+S4sggNA4fQFYWfsqubKH5EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VjcnveP7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I03x3jaO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VjcnveP7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I03x3jaO"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698KxuJ3921803
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 22:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x1R3a3lX7xBG1rH21ZiJOz8wd4EF5DgZhVhNu/UOfns=; b=VjcnveP7FcU+lCYS
	Ba/x4qVGtl4f31sLb2fJW9V93vtlaj1jvzXL0GZ60xmRCglZHFQWydv+f95h84j/
	h0fSeuKGvt3SdUE1GRItOYaLsRjsiUrvbdBSn7yOVT7WIl9Ck2vCeK39JV/fmhgk
	f6A1PDe4cvLV97WX9v6QYldbSRF8LkehVPwDZw7QOV7uIMTOQcVL2qgFjEHmr/Ze
	GtH8y9R1W2D6VqBck9isC7qpTqpsQCeICJcUJKoJWg4UeTl3Yq7JBlhFhh3NiBDi
	OeX4nAfMv3Npv+E2OuZNmBKoDPj5E0JhZydE/n/N878MUKtq3oDL8ClFO6E0rOnk
	JMyvDg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxw8xn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 22:56:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d5dbso585052a91.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 15:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791500174; x=1792104974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x1R3a3lX7xBG1rH21ZiJOz8wd4EF5DgZhVhNu/UOfns=;
        b=I03x3jaObcrrTFsyISzVHauh34wLJe2tIzcpICXz9lu0PUsqN3HSu0AgjOZ7pw5G1w
         sjIfOYIZDYRZnMcktiifbsfkZe7oSfTX+eqp7YC9c4a0WMu5jUC+cgD/9wyy52s1+oC8
         sCOe1gn1KDLoOA9CDZdbXy+D1USVEBiiJYU6P0EewARSU091MvCLx6oueyo7AAcdhK0a
         oHWod0/NXTdprQvNRcgVoEleNDX1r2OFX48tWQlu8yTaMowqnNmQ3LZt6vjFor/bFQkk
         6ljjlP72eYHzVZpe3KXPXeph8qtX+WCjNp0hIiXrzhabuxQNHqjxauRyoaXgRXLZsgW+
         jcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791500174; x=1792104974;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x1R3a3lX7xBG1rH21ZiJOz8wd4EF5DgZhVhNu/UOfns=;
        b=bDAZ+kEqfWyoj9EY5nhgX2EPQpf548RUbCbbqHjXWsMo/920gtw4ohyUPguFIc2teg
         k+eo/int7UuqKdj4tX/JskfzBkn0i2+zgzqhhULmN3ZJdfhLnezg3fPqC7NSwZOVLA5n
         iy++4EP6dRJWnWsdGJteAFJd+Cghcpy155yXcM926P6oWMQCZFKt4C4TWKJ7/uZEGptA
         tYniEST0LEKGBuMw6uIrj0P59sDaPc4Rgf8h6iLgGtRt9qEbVvEO/jSEMfhKpdPpTSn6
         tlLvWv/fQT0VoFFw15RGD4Nx1xRXu7sJNxEoJa/Q9fLeLcOeZ3WLn1hSrKM534/UsKi0
         Fj6Q==
X-Forwarded-Encrypted: i=1; AKwUvByNda3zX0soL9kHhDfP3x8rAe9JiliOVDh/GNRUblYM7ydw3RPcvW9rmM9X2AoR2b9G/exI4Nay/tl0@vger.kernel.org
X-Gm-Message-State: AFq9FYKeHp/MexdYs7zN/LOZNkggRCT45B9lfbSVwqbFsQVzmeeBBaiT
	MTEAm2ywlkq60pWvnNFkQ500NwGMB3zpDgggQ00/E6Lt/WxuYtnN/qfjOUG+pu7mqB9gKvUSOjU
	9WT6eLwju//cB2nAz0ymBm5LG/kTHhMrB+DJ1w+bekp273dSZ4wFPLXLi5uunUAE=
X-Gm-Gg: AYBFou2SxBjhRgIUM/emPyt4f17ezgS3Hjnpbu6VGAmNTvb/BOnFDHJJ1u8/CfpmvGI
	Qi5XV+BnV+gez7ADwXlR/2MkWh9piYFpEmJ/JWbtOcOSvILXe526v+k+vDDNIwSWfBsXM4pWo7q
	7M1XYVRsL32ikTyN7cfOcCDlIZsTa3IoqgVpNPCZEZiSVzDEk32hyVLOtYngJOVlkPSSpfaJV/e
	A0AHuOeBNs4Jpf7wxatKF0HDcHZjLFt6oc1FTHHk2J+W/J4mpjS2HEIQr63thqP1sNX7uyJQwUv
	9+FmZxfIet458salJpEwl4yZRJIHdKXbYqXu4WMin3MgZuNETUDWt0b7IoG0d43xQwONdAR/YLu
	mh/Mricm7nZ+En5Q6vPALvYJrA3LatGdD
X-Received: by 2002:a17:90b:3b48:b0:3a4:dc2c:be9e with SMTP id 98e67ed59e1d1-3ab3a8d5755mr217297a91.51.1791500174395;
        Thu, 08 Oct 2026 15:56:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3b48:b0:3a4:dc2c:be9e with SMTP id 98e67ed59e1d1-3ab3a8d5755mr217285a91.51.1791500173870;
        Thu, 08 Oct 2026 15:56:13 -0700 (PDT)
Received: from [192.168.1.86] ([65.181.12.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38ddac6dsm549161a91.7.2026.10.08.15.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 15:56:13 -0700 (PDT)
Message-ID: <f5682a0f-a0bf-46f2-a238-faeb1333c071@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 09:56:04 +1100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 6/8] tee: optee: execute yielding RPMI calls
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
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
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
 <20261005-rpmi-tee-service-grp-dev-v2-6-72f222e23ec1@oss.qualcomm.com>
 <CAGgiveUzBk0Na13cqPRnQw8y2XdQ9LLktFK5eaJLTMiQZJPc_w@mail.gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <CAGgiveUzBk0Na13cqPRnQw8y2XdQ9LLktFK5eaJLTMiQZJPc_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA5MSBTYWx0ZWRfXwBuSwPT4LDMu
 dUBeE69T0vWhrDQdZ3scJo4kNiCIGsjQQdeuAT1YNLYPU41v8xA6eV4WJylpGGF4JDo5sm/FCJL
 my+U83SCKVNb8X1YKh0xOme6wBkVpUqM9M6rNW6KaQ1h/PWK1sbb7Vnmg6z4/2HgbNSJ/5TnnRC
 tFIOgm+4LWisNhF6Z+qKmese/cZcisQ5p+/BdCabOvbL5k1mK2hpGv449xjDSVob+KXyIsxRR5I
 QFiLTI3lQWH9nlj8g4klLgzYs6Y9p/z0UuzkKROKCSPciKS/OnbmBTu9Db3sm5p0UCsunPMQy7Y
 xF247nPA+YyjOsRb6CEmb/5glNsEqdWQP2Cv9kjUk2rW+8Cu9j51SIdIhISaDEDiqea7BFhDL5Y
 HElL/iA2KOfdOOOK60MqCrI4xAtWXWcPj0J4yN+BKKtKpEQy7YtizeY1pEoL12ocu1KuF8z/yV2
 RxYUBAHnnpWg6gIXKOA==
X-Proofpoint-GUID: bxSMh48XIkItNn0MHGixyLCGly5QTB9E
X-Authority-Analysis: v=2.4 cv=cMB1IVeN c=1 sm=1 tr=0 ts=6ac81f8f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=9v5PfQ1E2GNzj2RibJmqVw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=AUF5Mc4sii5JqdCOvnQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA5MSBTYWx0ZWRfX4z2aLtVWjuOF
 YTAwig0Rj4cFs0l9ZLf5D5i7nYt2umV1EdSrd44Kb2tCvD6I8P67Vho7+i4jUL2gpi6ZEqS8nOF
 +mlKhmkeOhB0V9BAyxkLYZuGsZHh/ho=
X-Proofpoint-ORIG-GUID: bxSMh48XIkItNn0MHGixyLCGly5QTB9E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_07,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080091

Hi Jens,

On 10/8/2026 7:11 PM, Jens Wiklander wrote:
> On Tue, Oct 6, 2026 at 2:40 AM Amirreza Zarrabi
> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>>
>> OP-TEE commands can span multiple exchanges with normal world. A call
>> may yield to request an RPC service or allow interrupt processing
>> before continuing execution in secure world.
>>
>> Add the RPMI yielding-call path used by the common OP-TEE session
>> operations. Submit the command and RPC argument buffers as ranges
>> within a shared memory parcel.
>>
>> Handle RPC requests while the call is suspended and resume execution
>> using the token returned by OP-TEE until the command completes.
>>
>> Use the common OP-TEE call queue to wait when an initial request is
>> rejected with RPMI_ERR_BUSY, allowing another active call to complete
>> before retrying.
>>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
>>  drivers/tee/optee/rpmi_abi.c | 124 +++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 124 insertions(+)
>>
>> diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
>> index 58d82678be98..6e76316794c1 100644
>> --- a/drivers/tee/optee/rpmi_abi.c
>> +++ b/drivers/tee/optee/rpmi_abi.c
>> @@ -9,6 +9,7 @@
>>  #include <linux/mailbox/riscv-rpmi-message.h>
>>  #include <linux/overflow.h>
>>  #include <linux/rpmi_tee.h>
>> +#include <linux/sched.h>
>>  #include <linux/slab.h>
>>  #include <linux/unaligned.h>
>>  #include "optee_private.h"
>> @@ -560,3 +561,126 @@ static void optee_rpmi_handle_rpc_cmd(struct tee_context *ctx,
>>                 optee_rpc_cmd(ctx, optee, arg);
>>         }
>>  }
>> +
>> +/* Handle RPC command or interrupt returns from a yielding call. */
>> +static void optee_rpmi_handle_rpc(struct tee_context *ctx, struct optee *optee,
>> +                                 u32 result, struct optee_msg_arg *arg)
>> +{
>> +       switch (result) {
>> +       case OPTEE_RPMI_YIELDING_CALL_RETURN_RPC_CMD:
>> +               optee_rpmi_handle_rpc_cmd(ctx, optee, arg);
>> +               break;
>> +       case OPTEE_RPMI_YIELDING_CALL_RETURN_INTERRUPT:
>> +               break;
>> +       default:
>> +               pr_warn("Unknown RPC func 0x%x\n", result);
>> +               break;
>> +       }
>> +}
>> +
>> +/**
>> + * optee_rpmi_yielding_call() - submit and resume a yielding RPMI command
>> + * @ctx: calling context
>> + * @req: initial command request
>> + * @rpc_arg: shared RPC argument buffer
>> + * @system_thread: caller requests TEE system thread support
>> + *
>> + * Only RPMI_ERR_BUSY rejection of the initial command permits retry.
>> + *
>> + * Return: zero on completion, or a negative error.
>> + */
>> +static int optee_rpmi_yielding_call(struct tee_context *ctx,
>> +                                   const struct optee_rpmi_call_req *req,
>> +                                   struct optee_msg_arg *rpc_arg,
>> +                                   bool system_thread)
>> +{
>> +       struct optee *optee = tee_get_drvdata(ctx->teedev);
>> +       struct optee_rpmi_resume_req resume = {
>> +               .op = cpu_to_le32(OPTEE_RPMI_YIELDING_CALL_RESUME),
>> +               /* resume_token is nonzero after OP-TEE suspends the call. */
>> +               .resume_token = 0,
> 
> I missed this when reviewing "tee: optee: define the RPMI control and
> parcel-reference ABI". I'd prefer if the resume_token was a truly
> opaque value, just as for the SMC and FF-A ABIs. Any reason why it's a
> 64-bit value instead of 32-bit, as is used for the other ABI?
> 

Agreed. I currently use a zero token to distinguish the initial request
from a resume. I'll track that separately with a boolean and treat the token
as opaque, only copying it from the response into the resume request.

There is no specific reason for it to be 64-bit; I overlooked the
existing ABI convention. I'll change it to 32-bit.

>> +       };
>> +       struct optee_rpmi_call_resp resp;
>> +       struct optee_call_waiter waiter;
>> +       u32 result;
>> +       s32 status;
>> +       int ret;
>> +
>> +       optee_cq_wait_init(&optee->call_queue, &waiter, system_thread);
>> +       while (true) {
>> +               if (resume.resume_token)
>> +                       ret = optee_rpmi_call_with_status(optee, &resume,
>> +                                                         sizeof(resume), &resp,
>> +                                                         sizeof(resp), &status);
>> +               else
>> +                       ret = optee_rpmi_call_with_status(optee, req, sizeof(*req),
>> +                                                         &resp, sizeof(resp),
>> +                                                         &status);
> 
> Please fix the too-long lines above.
> 

Ack.

>> +               if (ret)
>> +                       goto done;
>> +
>> +               switch (status) {
>> +               case RPMI_SUCCESS:
> 
> Any particular reason why we aren't using TEE error codes here?
> 

I defined RPMI error codes consistently for all control responses in optee_rpmi.h.
However, these statuses belong to the OP-TEE service ABI rather than the transport.
I'll change them to TEE error codes and keep RPMI errors at the transport layer.

>> +                       break;
>> +               case RPMI_ERR_BUSY:
>> +                       if (!resume.resume_token) {
>> +                               optee_cq_wait_for_completion(&optee->call_queue,
>> +                                                            &waiter);
>> +                               continue;
>> +                       }
>> +
>> +                       fallthrough;
>> +               default:
>> +                       ret = rpmi_to_linux_error(status);
>> +                       goto done;
>> +               }
>> +
>> +               result = get_unaligned_le32(&resp.result);
> 
> Why not le32_to_cpu(resp.result)?

You are right, there are a couple of more of this that I missed.
I'll fix all in the next version.

Thanks Jens for the review.

Best Regards,
Amir

> 
> Cheers,
> Jens
> 
>> +               if (result == OPTEE_RPMI_YIELDING_CALL_RETURN_DONE)
>> +                       goto done;
>> +
>> +               cond_resched();
>> +               optee_rpmi_handle_rpc(ctx, optee, result, rpc_arg);
>> +
>> +               resume.resume_token = resp.resume_token;
>> +       }
>> +done:
>> +       optee_cq_wait_final(&optee->call_queue, &waiter);
>> +
>> +       return ret;
>> +}
>> +
>> +/* The caller supplies SHM with room for command and RPC args. */
>> +static int optee_rpmi_do_call_with_arg(struct tee_context *ctx,
>> +                                      struct tee_shm *shm, u_int offs,
>> +                                      bool system_thread)
>> +{
>> +       struct optee *optee = tee_get_drvdata(ctx->teedev);
>> +       struct optee_msg_arg *arg, *rpc_arg;
>> +       struct optee_rpmi_call_req req;
>> +       size_t arg_size, rpc_size, rpc_offset;
>> +       u32 parcel_id, nonce;
>> +
>> +       arg = tee_shm_get_va(shm, offs);
>> +       if (IS_ERR(arg))
>> +               return PTR_ERR(arg);
>> +
>> +       arg_size = OPTEE_MSG_GET_ARG_SIZE(arg->num_params);
>> +       rpc_size = OPTEE_MSG_GET_ARG_SIZE(optee->rpc_param_count);
>> +       rpc_offset = offs + arg_size;
>> +       rpc_arg = tee_shm_get_va(shm, rpc_offset);
>> +       if (IS_ERR(rpc_arg))
>> +               return PTR_ERR(rpc_arg);
>> +
>> +       optee_rpmi_shm_get_identity(shm, &parcel_id, &nonce);
>> +
>> +       req.op = cpu_to_le32(OPTEE_RPMI_YIELDING_CALL_WITH_ARG);
>> +       req.parcel_id = cpu_to_le32(parcel_id);
>> +       req.nonce = cpu_to_le32(nonce);
>> +       req.arg_offset = cpu_to_le64((u64)shm->offset + offs);
>> +       req.rpc_offset = cpu_to_le64((u64)shm->offset + rpc_offset);
>> +       req.arg_size = cpu_to_le32(arg_size);
>> +       req.rpc_size = cpu_to_le32(rpc_size);
>> +
>> +       return optee_rpmi_yielding_call(ctx, &req, rpc_arg, system_thread);
>> +}
>>
>> --
>> 2.34.1
>>

