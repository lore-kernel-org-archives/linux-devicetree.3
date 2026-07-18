Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56238332621
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 13:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784380568; cv=pass; b=pqI6eIG1PwlqE3ZH6Gv/ekvuHXq1HbcRgwbwAFKZ3FqdZpIdHUGHA4MzHC39EmFGLUHmfFNof7GaDzf5ZYGzww76WQr322qEdpT300EGUF0HMg84UDvXXaL6oDWLXxMOUyrMqq9PMu9JLAdJgDuMTYrWQwKmkwF3RJk99EQr/xE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784380568; c=relaxed/simple;
	bh=YWWKKP1NM6Xa0xF/SbN0PUecmshCSpxltTzIGLfBlEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H1yFkBtU5FYb0FFkJpRbvqqH4c6tTb9osYfX/dCM1GExYmkRiAUboxwTqgLL4YkfDiSIEm0CfFos8R0zpF0AbDCls/o0ANPVUMU8MSXPzT+TLM2tQsQE7bncHUbBbrCymMTfcfBbxH4RgAe9Uh9k9BKQImVLhBzek3NrOyAn52M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d3Yifl/s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=StQ3qtuH; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d3Yifl/s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="StQ3qtuH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IDD2K9538188
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 13:16:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s9LsI7Ks+5OkPcssA1dh56fgkFR9EggGyTbFx1yU1Gs=; b=d3Yifl/ssXQKGn3D
	DF+HGK4Iu8BpBWya3mu5Id9HxJPdHBvBYpMVHe9NoVde4B/Is8gKcFn2MaHMRoKj
	R0bDknMH/EDuNs/1BB2f0bGP5N3TW805FFJuvB16UvV4qhj/GnafRYo9y+UoTD6Y
	/ryL0ZwgJ/x3Hck8/IL5eCjqyrePpOB+xGNerA3Cz1eP6DBc97zST+Jyz5Cr5ldP
	9t+lea3FqT9rOS9S2+Mh50uHb8B3NI0AoOBeDx5SO3HqZttLttRdn4bA4DnMoHNj
	dBkrPP/rYZJoPGyv2S/N2w5RvhOVFI/1kTMjx+RKu9QyBqFV9C4iVLPsHyWyWIeW
	vIkcRw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2s7rrd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 13:16:03 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90410c668adso172142486d6.1
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 06:16:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784380563; cv=none;
        d=google.com; s=arc-20260327;
        b=XV8fSiEhSUP7gV72xbz2cxF8jJNIMmHCicmc0U/UVC2nUML4XZc76OdHT4LnmtDHfW
         +8ieUIENAn34+i9g108q7lMuWRqGf6AuF7LUvO5c1Mf4WEyBYsR8uxy2zDOZ5HyQh5xu
         t5Vqp6ac7TX+wKlyf4UnXC9w4SLchC1JuUqHLjPY1B/ZHCIdTDfbRoEgi6RtQCg85kjD
         r/lom4nxbLofL4dxMF7BMk2OULpmlYAl+KPgbzgdViXRJiT/ttQ3WGR/O5xfGPQhYy32
         5m+H/r820Tzl5Gz/gz3RZqe4NVbf8wbNMBsVfLccXP85eoNRNpiIWLuDUqAwRz87jKmM
         nk/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s9LsI7Ks+5OkPcssA1dh56fgkFR9EggGyTbFx1yU1Gs=;
        fh=b+ybiL5qU4nyrqcNYsO4hQiV85FSH7suy4lGoblcAvg=;
        b=dmX4JJKOKGxoZgueWKwnIbYSi6hKLfrmdMYXbqI8SyY4EYnUVx1BuGYtjZFQbdQs+l
         GI2XiUGW3sA2EPy7WPo8s24HxQollNNvrmuvMUBuzMtBtRaOPP11O4gD2mh0HQsDKp/v
         w6gsgQ3xC7sEL5rXcDrI6vMRfsMtMn4JF/DM6nuOw/mgDdUPiUUtmb5R2FUXY287dU6j
         jZokJTY5v0ghJCwo1uFhJlXSVnEai7nq8gCazHRC7ZApIQf+pcxmOg/ZRFST55CVZ48Q
         saa2/bFv/EneesV1yIXYddXtvgXB/bd2EnX+9AOOzRWZD2vIH9HSCU6PuTPGMWjcIwyS
         Gziw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784380563; x=1784985363; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s9LsI7Ks+5OkPcssA1dh56fgkFR9EggGyTbFx1yU1Gs=;
        b=StQ3qtuHpv1nuifEY3zPpij/Zm4TOf+WGz5i0+9EUGI0tn7ZtXRCYjO219CJutBou8
         wHd9Wz8B2YdonykiIl/D1ap9f00dyZd5TVK4jcdLkkf8sHeJvOtvnerh0BfCW7Lu+G0C
         YTUva9HDa9cYoJe6xGweJxgNZ2K3t7L5w9+xU/B13on+QaY+BA+khQU1tG2cU/DutKNT
         Mlev33oN+jc0wbieWrtGkbFeILRfBvssazBy7A4Grn/0PzhzhCTweUg4KjKm0oTSwcLB
         B0GOxDxS0Jatn1CdvEcYcAMzSdsa1zgD7eJjcNaahuJ4rBTx5SQHAw6YR5zANclL5paA
         2mWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784380563; x=1784985363;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s9LsI7Ks+5OkPcssA1dh56fgkFR9EggGyTbFx1yU1Gs=;
        b=Knaa6aAyLvqUY8DNwZabzkkdkFUJ+algVrR9+6gKosVKI2i8WUANDHpmi19h717vz5
         C8JALzb4cC9+Vuenk1NpOmd+2GqKI0qADI51TNMhPvELMIvkpmTIetgHnbZj0hd60kb1
         JaUuabDS/z+QxE3AfkTpVEbohL5bRUX8J6z1v7kDuwi35sbOXBoduE3ZMMV+asmdf7Dk
         9V5BXJMUOjSjrBh6PCMRUpIHt+8umxoog2pQ+f98E5A642Keus/oiF616TkEkR0NrvRt
         CsictIEnUk/F38OdjD1gD3UwsSQFLPvCRpaQAk/lr+3HJTlOsTo12Z4Mq6IdKfZ6/f/4
         2hhw==
X-Forwarded-Encrypted: i=1; AHgh+Rq3krchom1dZqWfq0pM61UEEpPvQXfb/jpSveUD4XNDSBSpjjFJ7rfFq55IiWpeRBuxxPhEv05qsnpK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo8+BE/nXuj5gJM6R9dWvD9q5/QVGRBrfY8880ThY7qHTw82m9
	d12WerpIwdFVr89yuJIDzGdgX7ttYF1YctmMjPD3mU/PoZ0+RKAEUgP40dKtsQlQWNB6wk2afgj
	phSJRpM26mksaxAczR5MTb82KHi01jXSkn9snKo9cYkOlS2ZLxAbWvJWscUZar1KeiBOeR/CZpb
	QmR5rIEdbOEQX32RR1O6A9JdnCv3J+4I3YFGq01LM=
X-Gm-Gg: AfdE7cnVpcgYc3+R5LJZSBlh9aTEmJKmUJnOtIcfvCeDysiBosCdlOjs45ETp++bj56
	G8KwF7KIVcPYmeiZO5861R8mFNVZcXPKM2yoc17E5voqy+cGrG2LSU5TMgNQQvIQ2tdVDXhstKa
	UyOMLnfXnOZLPCPjjFSJ1DBJWknlHb/0xSuzXKXdN6+JFqkvuHdIxOBZ9aMw==
X-Received: by 2002:a05:6214:590e:b0:8ef:b23a:d741 with SMTP id 6a1803df08f44-9077834b1a4mr72688876d6.28.1784380562847;
        Sat, 18 Jul 2026 06:16:02 -0700 (PDT)
X-Received: by 2002:a05:6214:590e:b0:8ef:b23a:d741 with SMTP id
 6a1803df08f44-9077834b1a4mr72688496d6.28.1784380562406; Sat, 18 Jul 2026
 06:16:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716232641.2659710-1-jm@ti.com> <20260716232641.2659710-2-jm@ti.com>
 <CAPx+jO-a3+mv2msL+12Ag-xs33es2+Wxbr_uKRMY3rbN7eL-cw@mail.gmail.com> <305cf4be-2f45-49b9-b933-05ac41092685@ti.com>
In-Reply-To: <305cf4be-2f45-49b9-b933-05ac41092685@ti.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 15:15:50 +0200
X-Gm-Features: AUfX_mxgm4OIA1ZLU83yHMzhZPvibIUr7WGe9Jot9LtHhbgQdK7G8sCeNXxkvAw
Message-ID: <CAPx+jO8F8UQi=ZSO0qRX1vtfximLWvuqmYkpbqm2+9xeB+qQRg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: mmc: Add post-power-off-delay-ms property
To: Judith Mendez <jm@ti.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzNSBTYWx0ZWRfXz8krNyCjC7RU
 eVCW4mKV6dBV/oFb5nqsW4+uUZLS1QNLqUmDxmekfeD6lQhFCkWMG8O1n1dTMsSOOPWF3FnP4d3
 75dUZVZZ4RzW86pQbH0Z60aMD1xAUhnaFcojH5u4ceMWDrQjTJuPWbfW1jf0FtTkFdTgzGY4rvX
 BbYSmwGSs++khLOcp8uf4OBsFkKU0k75YAb1ElYr4UDWBgo5rCn6YtCE/GHcEzDqZj/6rggpj4C
 OBGM1CVQfW2EPXg0rdf4RBfvhuv//sCaSc4PVRFEvM+Xe13a8Cgjz8PTxSY8rAEUhBuM1mxQgs5
 38xaG26+A8H7o293+JZ3GrSiOGA968nuwFc2JVAKspXlWjFcWNbz9+Fs+9vNRgFbL78PJpsVZxA
 b0ospL6qI6h8ZuiNDazWozDdpG3kR8UAVFmhLnyu9PAOt5/Rj7UI6lN+WCLZUtELRIuHD3QqzHW
 Kltw+gJI+LDVekx1hhA==
X-Authority-Analysis: v=2.4 cv=eKsjSnp1 c=1 sm=1 tr=0 ts=6a5b7c93 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=sozttTNsAAAA:8 a=4ud4KnGQRwzs3n7kg5MA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 4RbmhiYFdzaYUDAS51PburaZgVhr7jTu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzNSBTYWx0ZWRfXybrJdn++iRSn
 A5g63j/OIWlmfRcs7PZAGrudryhnKyuAK8ljBPkY9Cck2lOmo++jUSsAcHmf1g0CBTOBVzsqZkS
 HBpzAMtw15md30nUiMxzgkiJ9JbKTIw=
X-Proofpoint-GUID: 4RbmhiYFdzaYUDAS51PburaZgVhr7jTu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180135

On Fri, Jul 17, 2026 at 7:40=E2=80=AFPM Judith Mendez <jm@ti.com> wrote:
>
> Hi Ulf,
>
> On 7/17/26 5:21 AM, Ulf Hansson wrote:
> > On Fri, Jul 17, 2026 at 1:26=E2=80=AFAM Judith Mendez <jm@ti.com> wrote=
:
> >>
> >> Add post-power-off-delay-ms property to MMC controller common.
> >>
> >> This property shall be used to specify delay if needed after
> >> deasserting power during MMC power cycles.
> >
> > Please clarify with some additional information from the cover-letter,
> > like "specify custom delays after MMC power off to work around
> > hardware issues such as slow RC circuites on MMC VDD rails."
> >
> >>
> >> Signed-off-by: Judith Mendez <jm@ti.com>
> >> ---
> >>   .../devicetree/bindings/mmc/mmc-controller-common.yaml    | 8 ++++++=
++
> >>   1 file changed, 8 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-comm=
on.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> >> index 3d7195e9461c3..3ff68d32a308f 100644
> >> --- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> >> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> >> @@ -275,6 +275,14 @@ properties:
> >>         not available.
> >>       default: 10
> >>
> >> +  post-power-off-delay-ms:
> >
> > For mmc-pwrseq-simple we already have "power-off-delay-us", perhaps
> > better to re-use that name instead.
>
> Besides having the same dt property name as mmc-pwrseq-simple what is
> the benefit of switching to power-off-delay-us?

Using ms as the unit is limiting and completely unnecessary. What is
some HW is fine with 300 us, for example.

>
> All values will have to be in us instead of ms and thus will look a bit
> less clean in code. If it is just a naming  preference, I do prefer
> the current name in this version, please let me know if we can keep:
> post-power-off-delay-ms.

The code is a separate thing, this is the DT property for supporting
different HWs.

[...]

Kind regards
Uffe
