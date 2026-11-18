Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795004048;
	b=z4xNBC1TlRrdOKmBmy9fKWnpndqEckABMAbprhQn7hNgMuHfDJtVovpPB4O0NmN1EOVC
	 rTYcib6LcAyWzvSLx8PU0/QzT2+WpyH02g7KinSV/2CJ30dVSpT0JbfjzmXMcljMHiLGe
	 yKPayddTEQ8ZZCjHWy+YLctAW4nu+X/IbRoNDbXtLBHRLV0ZO1StHirJVg74r+4CSIfwb
	 H8vQlU/MKllNH7WC7kqptDI+oWla8smOnPvH4ynjY8RNfP8zTZjtBmGPj0gVBycf/SS1e
	 V6wxez1VSoq7ZQ0Wb1btXjzfEvWMUPM0OPc6+OpH8JCV444wiraz64thOzQj97QF+7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004048;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EmDCHtd+Q0jDNVcYgBi4nVBZdZ8eCWrrRfV/qG90diM=;
	b=jDGivw2C0JYHbNcl4ZKGPwp4gCnEleZqylIGcWytx9BQHvR1g49LN7b4AhEJPM6e9iky
	 KRfIi2jJzOugn+bTEWk2rr2BHL/owGd9zO+pjIigVk+PMxdeWXdysqbjZYleBdl010y7c
	 +V8kK9YymAfaRO/gn+Glgcjsgab+ZFTzuCDzl9PIha/I9gz7wSO3e/aY1OnMqF/7fOYMr
	 hScwsDjvVWrCb6fybCOwBtPgLJnacYQFH3XRJEGKA5vfv++F0O70GfHXNOkJuDDJ8C2av
	 nolIpo7v1oHaDsaZh2Mt7e6KtYEaYm9q2l0fMvZvp0sgEWduoX3PZuMYw3AOzhbjVbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="SvR/sSus";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dSEts7Vq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C535606A337
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C535606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SvR/sSus;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dSEts7Vq
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIBkuFa3223989
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EmDCHtd+Q0jDNVcYgBi4nVBZdZ8eCWrrRfV/qG90diM=; b=SvR/sSusgAAfN746
	9UFnReufWOyWMyRHTAn6lQBClvNKkHfcuIA2GyAVMtuRCSGj1l/c+feTFDvbPPdU
	uNJEaiazG0AExTQsU4QZ3Xr1JWPyN0A+Jv/YSV2jUhuNi1m379pxfFpIWUqgshei
	08RdiyGdWidPf1BMt9lgn+LK74AU6DVwdtWLYGvEkAHYhmhEXGlkjkdIEPMBhdw9
	rMkIBeN/HkFJxrVMYJX9AaqjZikGD0HSJwIDJfEotz0/K4aifQF5EJEyewlB7HXw
	xJ7q4phJ6PWjkSvhzXDzHu4O8mPDe2QgmOg/p4jPgThN9XV1ydsPhI9mEwLyLniy
	cYfqfg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8jxrm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:14:06 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b97460a133so758617b3a.3
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 04:14:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795004045; cv=none;
        d=google.com; s=arc-20260327;
        b=BPzO5asV2I8RRoGW1dokpsDUPp7CzrRIgYHfgv7LZAIvk93QLt9Ved0rvneLYcK5vY
         7dwFzIhVRK8ZqktqvFaRC+sfIignkvwgheAIofQfBPRzPSopqyCqZD85bPB6Ogyohm2Z
         3wKId4nSZlpQ+/M+1u+p4PzS3IZa2ScOgjCyjq/KsCPSxWXhC3ebIZQVTiyDnP+uwdkE
         pqyiLwCyXvzXnHQX64ByV0QEFuPxQ/KkY0WIEkL5sv/Z7USQHyvyQ5h4DQaseupPKuUQ
         IYoLolzkDb10aQO5x6F6I18VhE+C9sI8/HdR3VNMnVoqLzSd5EuEV91VmHyR0qDJsUpi
         YqpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EmDCHtd+Q0jDNVcYgBi4nVBZdZ8eCWrrRfV/qG90diM=;
        fh=7uW/6HJHQ2+caSfZZVHKVvOzt4h4BTs9oMyzatYDopU=;
        b=Ayx5+ETiScdez9F7XfIIqBxmMxUcMlsnbWyBF/sGRcfCrjDxv4mG6ST65pGLeM11hm
         3UnzzVVy7fm5f1K1m34om9Wug3FSyeEiiyrFW6S29WtAqTUnyyBePs0mPaBeiEHg4Xc6
         2KhHtFen5wSgV6xtAa4Igfdocki2f6AeXW9ZC5/YKcguyelmPN1c+7nFNLY/IG/jGBav
         5y6vdbwsUTh4GySvbDfXK+ywri5XeRs84zGFRLOBEJ60XUpvbFiQwzEUPIymdySFvgsS
         maMfGYTwMVVTT4rRwpCD/K1XOGlPZjpSj1gH5uIHVP0Z2djGT48OPy53+ZbQFThzXpln
         ddFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795004045; x=1795608845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EmDCHtd+Q0jDNVcYgBi4nVBZdZ8eCWrrRfV/qG90diM=;
        b=dSEts7VqGraYLgJDKwHn4AHzw5xkPDP4b/jJHPEGgqww4Bx/KmZKTH93cX7Nioi0C8
         RxYU1LslyCbKWFAC93L/NkPcnq4orDOizQNfvarjfChtMndXivJtX88rCG2b64VFDnaz
         30NudmO+yX8Cz096uQk5cUi7Fbdhu1w1NIU2EeldkktLiOqIKRXmJgC0MdCbwYbYf6sF
         nhB4olhDqmfPHApbyTw5uK46rUnrAPGap820TVEUyMlb1TSHvJRle+e8k2XWfFq6xTkt
         vDAO1xUVPoqwc9TGhwOHC/fGFsEII0RPAb0EtJveYumUDOimVbbgwembwMTtr3itQN8f
         4Ktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795004045; x=1795608845;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EmDCHtd+Q0jDNVcYgBi4nVBZdZ8eCWrrRfV/qG90diM=;
        b=mOPVZMcDCEnGQDmcTzlEF/b9PH5d935hWVBbwJ57LYyEZ0evuIp4ynjhLyUrP8aT4m
         SipKGauIY+hnTHRRha3a3t0sHbMwChoWddlGYRzAxqRDQEy15VgVf7jOahwQwbDL8c6m
         cijxkFwVlaCphM/KTyZkJ5rE20YOWYm6pqzI0SDpeCI0NCiGFxJ61HjKDc8wpEhbymlu
         n80CkCDv5W2263OzUqDHxx00p3bHDgw+/LVJaCrwKpPVo0EyhYw3zlQsE1ri3izvah7k
         L6dw05IY6nFTlzgp2GHW9A1coTIoEUY4rMpHfqgXf5NZhd83w66rVwv8h5rC3+sBEhyw
         tbKA==
X-Forwarded-Encrypted: i=1; AL+hErEvEpRzUVfCQDKsK9T6IUFzGjG3YVV1eBSkJiS0wGD4ITXrOj/2lAZd949mVk8ryiaVUgONDQ5ldBra@vger.kernel.org
X-Gm-Message-State: APuU4Z+dQeL+kNTaq85h4r2/t7lf2rd9xHTps0t6NiNhz0DrnBvK9ov8
	qjxFe/rp32gyfeYKyBX+FqmYT0bB09yJunSL4mm//LXs2wonfyi2kpsumGnRzeb40+m8yqhKmXt
	qhETOGbJAZmQGoFc9J4qyaIJ+i1Yp1FSeFTYu57MUDyG5xpDooIgrRl4NchXlrZvEWTQD/QNxL7
	RQLq5KB5LZ3XK/3ucq1uYnVRczimt+j69SEHL/4v4=
X-Gm-Gg: AYBFou1uzwXQkh4t+VIYKTAaz1lc8nxPePQlAbPuyCZeeMU567d+X2INyJLL2s/ODBa
	ZIPdZj9AOKSMFO1JoVZcKOjTYjBESTEosfMNgh0WnuC1WcaF5blkjFUb+Q6RFwicy3kOCFSRfQ7
	/Iy0qUsJIPZ+KodhgccOraFiYYneALxYvmJE7BEbVWdEy5hL70rjna2RAHEgE=
X-Received: by 2002:a05:6a00:aa05:b0:89e:71df:d6d5 with SMTP id d2e1a72fcca58-8c5d363803dmr2099226b3a.10.1795004045354;
        Wed, 18 Nov 2026 04:14:05 -0800 (PST)
X-Received: by 2002:a05:6a00:aa05:b0:89e:71df:d6d5 with SMTP id
 d2e1a72fcca58-8c5d363803dmr2099197b3a.10.1795004044909; Wed, 18 Nov 2026
 04:14:04 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
 <20261001052243.3042627-10-mayuresh.chitale@oss.qualcomm.com>
 <41B3F89514935AAF+5c08fd7d-1cfb-428c-9ef8-035fa3910bd6@linux.spacemit.com> <17FBF8B3DEC33669+55643c4c-b5ae-4ac3-bb2c-a1653c3a6972@linux.spacemit.com>
In-Reply-To: <17FBF8B3DEC33669+55643c4c-b5ae-4ac3-bb2c-a1653c3a6972@linux.spacemit.com>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 17:43:52 +0530
X-Gm-Features: AclHuK_lmH3PRq6DteQT9bsd-ifWG5c7o_benTjtIXtrCBUSK48qIpxC1_u9aYc
Message-ID: <CAHuiULCf7RF07G8Nzgt6ZS0deWxMrBenWf9BaD615fLtwOzobw@mail.gmail.com>
Subject: Re: [PATCH v6 09/14] gtrace: Add RISC-V Trace ramsink driver
To: Zane Leung <liangzhen@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: H10VNJ9DzhZs6up64FpO1t6LnissY-wq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0OCBTYWx0ZWRfX6TPsvQ2/2qZ0
 Cdhk430uCdvf+SyiRB1GVgubs45Q0hHeCJrCvoXFP7nRL8mH7UtAtgmVWggkGul19njd2Lf5Jvx
 rDHb0kYiaai5YkQrRYJ+LiIc+H7KWnA=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afd968e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=lv0vYI88AAAA:8 a=WaSwiR3hT_GFvAymbGwA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0OCBTYWx0ZWRfXwWYwxj7LmBU9
 VFD8tbGgQ9Y5e8RBANOWGpI171QO0iRRhmVU10WRIiIPH9485KzLmjGX7CAIQW4gGI+lu9/YtXP
 1iduQN12dgjikVctcN7/xwPlk26dU8gsH1cgUYsbG0cvgTIozHqkv8wp/4JTy6bDnTyIrOgeeMT
 r7/CmgyH4PNolBR9O26TDy9O9CVww4OsxeTuh9EFagCEhcDOeb+q8JDD8YwqqASzaWVt7fONWfu
 f4Efu7JNyL4VjsHO/XdY4/EAfi9UFkNCvQsjpw2vM/XIXl4N6VfL1NLghgSgOCBJ0BHfIm0WwVI
 0Xv5MrQIGjabtx1Do/eTqJhv6B41vcukrhBlgMEfdChmNaKF/bN4eZH0gwUtxhIyq5/IWBcsetl
 Wk543Ec6iBjlm+V0pHiDOxC8/uhe0LLpeaa2XUFhb1yM87JCMOjQmtHlk7QmWXFOE15moTyO4by
 S/juXcWT6f9nWg4Vy2w==
X-Proofpoint-ORIG-GUID: H10VNJ9DzhZs6up64FpO1t6LnissY-wq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180048

Hi Zane,

On Thu, Nov 5, 2026 at 12:39=E2=80=AFPM Zane Leung <liangzhen@linux.spacemi=
t.com> wrote:
>
>
> On 11/5/2026 3:00 PM, Zane Leung wrote:
> > On 10/1/2026 1:22 PM, Mayuresh Chitale wrote:
> >> +/* Helper to access start, limit, wp pair registers */
> >> +static u64 rvtrace_ramsink_read_pair(struct gtrace_platform_data *pda=
ta, u32 low_off)
> >> +{
> >> +    u32 low, high;
> >> +
> >> +    low =3D gtrace_read32(pdata, low_off);
> >> +    high =3D gtrace_read32(pdata, low_off + 4);
> >> +
> >> +    return (u64)high << 32 | low;
> >> +}
> >> +
> >> +static void rvtrace_ramsink_write_pair(struct gtrace_platform_data *p=
data, u64 val, u32 low_off)
> >> +{
> >> +    gtrace_write32(pdata, lower_32_bits(val), low_off);
> >> +    gtrace_write32(pdata, upper_32_bits(val), low_off + 4);
> >> +}
> >> +
> >
> > Could you move these helpers into "include/linux/gtrace.h" and implemen=
t them as generic APIs
> > (e.g., gtrace_read_pair, gtrace_relaxed_read_pair, gtrace_write_pair, a=
nd gtrace_relaxed_write_pair)?
> > This would allow them to be easily reused by future components like Cor=
esight.
> By the way, please pass both |low_off| and |hi_off| as parameters to hand=
le non-contiguous register offsets.
Yes, I will do it in next version.
>
