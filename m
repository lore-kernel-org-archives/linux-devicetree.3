Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792642370;
	b=pzUsWpk8Us1hP4okjrpr/D+GnZoqgIh08h20BqbGOblrfv6+Qog/09oiMoerZHqr9u9Q
	 Di8srVQUaBEYCtEaAIQXhslNT/FX7x3OqDtGSxQhOSYXyfP8gPJCseBHOtERwtVCg4Xm+
	 eE5OqPFq5ifnj0GyWu755bo/1X8zlXL29fhd7g7fLz7+cP1jvgXl8oGXlR6i5/3n2G9jT
	 lAf1zus0H+RvYMnb3SrXQVbaSZavRhOvI1OAYgJlbfrY+kgJ61xYKkEj86/j29QlZt50L
	 OfIyYVHeC5XIioS/J1iTebtOZkDmJ90f78OKmB/giIMxFeqO4uK3ZDGyaapdlm6weag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792642370;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RFvh/3Uw91jbtXCdw8cETloCk2Qba5GfK3RNi0MxwyY=;
	b=BZNWKCmLcFCJUH4LZ3lS6uqyvFbqeRbrtDGPEnnnuOdB1wwC12TkAoiOWD2PyIV0sNt3
	 HcH45WPShBTb+WHtT6enpsMzreOZkS+HS/godfs9NF1HFb4pKkiUuNTcAkRkmGVJSlmbP
	 cAlfFDS6hU0Jb1iswpYoRuIzLVi7EaQDIZwWXj9kqT0G3G7eYJQU2hYv/D7+mMWr0bXYy
	 sFIBwwH/975awTB4+yA4MbofBWv9qsj6HC7ANmRal4PH041yQ2AT9P3yFflKIodI5toc0
	 Q6e6PDfgexvcSD9n+Mi1JSOW3sqf+zhZkcdOjo2M3OXt4v2/xoItYeh0dPdYI5FFtkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kp3I4RPG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YOHBzGIn;
	arc=fail smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75441606A31D
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 04:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75441606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kp3I4RPG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YOHBzGIn
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M3jLqr3172211
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 04:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=RFvh/3Uw91jbtXCdw8cETloCk2Qba5GfK3RNi0MxwyY=; b=kp
	3I4RPGst1xBcpDpOejvDpwFc90UDpg/3VqfDe3C7cVxEJGZyCP9uP3FMgVMCJloy
	rcJJ9LyxLzNbey5T5ScvLurlEQvD6f9tYaGyEcxGoPkDLjoJMlQIDz/XtiDvKRIB
	djn9MFbd7owI6BYVETwxlQzyw6c+dzM67HcwIZFch/xPw2kWs0xFAd83hX6E2GE7
	yotQ9smROW6iN0tue04HmyDnMQaDNFJca/ANOeAVm8Rja3J8/9+A7rIZJNIn7fJT
	gbfwVY1wiKaT2UEA7FSIBNDxCWGulzxAeqt9DOs3LqaNt4di+uyTlpUMgpvKL6cg
	fgf+C1KINGYLMm7cXrMQ==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93c8j54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 04:12:48 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-677deb12bceso2076527d50.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 21:12:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792642368; cv=none;
        d=google.com; s=arc-20260327;
        b=e7rYEul+lYh+61RzdhTpPsNLWRZ9+CK/MTyLJe++rd56Lhg++eqWEe6DzAwDtvzzwf
         n9EwxxgtLkBgHDscNtmjkYU+wC853CyuB7zo4KsKae2SH/D83rBbcDFTFLKPa6tdtzah
         3eGqcI/C8RisZWSoIVmV5wAvhetvAN0BYPN7Acn6obxrBac8rRFunkiThIr4uJ7vYmXW
         zikLnVM9/okXK0P/S8P6btmJvrLlT5K4CcS7Rz7qD/kO1e/7MHieeDIF1sI9UUyuGHiU
         mjexlTFRBBEW0qUX3h8HDlQAhVRU+YtFKBEVqm/8fBIOPVHbKa53ecRSVFlCaQzLPt7l
         I4SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=RFvh/3Uw91jbtXCdw8cETloCk2Qba5GfK3RNi0MxwyY=;
        fh=pcKnHPRwhqkRMui6q94wSvfE5r7OV8uKzYBAkVWrsps=;
        b=PoX9kCiytqjpS+shD51Vje05zVncMvZ4rMumpUcLGO+lBk3gezkbaNB1r6Q+J0XMa1
         J/40K/TMUVzbIgI56eytdTLFTDSBzLh+xpixOK1dlle+Zl9WukwK0EyQdBAsw0BPKH3x
         Nfw5Z0OmpWG/gJs5Xfzo5xwoYeXQhoep5RqeEbIbUG8zEHEtE06MJYwY7IKPYrvMufhI
         YWVTHMyLFwxVvBQkpPFzLKjd0t2ckC45HSEdZF4cQAxZv6cY8HSrO8vEsu9v4qsF8QCs
         rQ1Bql/WyAdBS7ltR2W0lHUfuJ59lzP+KYH5TPPLo1Cb7s8tooI/r3FcfaXStPi0ZBon
         OhgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792642368; x=1793247168; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RFvh/3Uw91jbtXCdw8cETloCk2Qba5GfK3RNi0MxwyY=;
        b=YOHBzGInnaCAvYtChxCfj6xySPTBfbuVVZtAHnG8I8xlVrHpdksMHxIfK5HHKhCgMI
         Kpkw+8kyJHxEK1Y+7PcmC9h2qGZNuc/bUYDWwrxUO34j2am6lrsUGGwphjcPSRznAyBO
         9cdGW0Bzxg1ucHIaaKKDLKbTtPXdGFfYlFFCrI9IaagbRlYoklAVwYVwDyQD9g/Ri6Hl
         jhksmRVsJg7WeahvVYoOTQQbNsRaB2+QRa7OmoRsx6lJugDSJ/jJGiDpFjX0kQU4x/tR
         63zMdDyCnFvAGpZH5Q63BaEexS5yI3gOL2bQO9OYzN7aBT7kGtQPbuPyYkP4ZyX3cEUC
         EzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792642368; x=1793247168;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RFvh/3Uw91jbtXCdw8cETloCk2Qba5GfK3RNi0MxwyY=;
        b=0WEbwHbEcGikyf/+mrz0wbJ+qDr1r7GyC/CKCU41IppJI8VlF9C5r5cNwzVcwV8S32
         R3pb9VuKtYnR3t4dJ9UgbidemgDcn0Y8YhEUY36KYpmv3M3y8VpJspyV7NNDmeoZJpaY
         SLS1p4/kP9KhiyyNCKqVZsVDtxY+THi2CdHg4C4dgJXXuGRG5jSLV/JCHW9gEoIgw0Nu
         QGa6kOyB4DywQry9XDEqaDofwgwylVUsv4vvWNCWWVoMuk8Z8yQIZhoPa/QcHyC4Is8Q
         HrgBA+zJgunSFJEdrcaQf4FZrSLXqGvMOLez6sZVuOvZeAtkEe9VOwTFXaNnJwC9eNJe
         4uqw==
X-Forwarded-Encrypted: i=1; AKwUvBy+5GKUZU+5g5FmvSRYKjynzIfL34wu2h4JxZnmfKKSiDmZTP8X3S4Aztr7f0E1RebqaLHwcqdmBDHR@vger.kernel.org
X-Gm-Message-State: AFq9FYLMWgjJ/XmKTSKeimLTMaFl8+J3m0Xr0YxDUITOYRs40wLr+n6a
	5lVRWBAJmgBbC1w9MPfbvcOMGE9Gtl4LOLhm4h3HyHLEa0LCAnsXvtJ7L/2VWjz7YOuczyr3MSj
	1AKIr/1vz204rCFwnJFWHaGTlRYtEECDwlnpNTPpv4TfaLSRSVspzkr0q73SmJIG7fF3lhkCv/6
	+ckSfWo3pOJ+rY5t9p/IwPescXKpsqN8uCttosS0U=
X-Gm-Gg: AYBFou26HAaMsuHBx3nygSr75rXaciM1pLqwjl496Y4L+Xt9THkRfG4cC/G3kXv9FM7
	SXg1Rs9aXZZ8xKQBnKS0YiCDSlsZhFIt5FFeGr3N3RJXdK1KKU+ZVZkH6rSPzkSyoV/cACoLCqE
	awKsN9m9NuNqqj62ODCGxCu1vMH+dz7dgpq2rGsdLNS3jQxm2hGVeyaJV81M0=
X-Received: by 2002:a05:690e:488d:10b0:679:a898:7d8b with SMTP id 956f58d0204a3-67a0e4bbf6emr1062093d50.35.1792642367614;
        Wed, 21 Oct 2026 21:12:47 -0700 (PDT)
X-Received: by 2002:a05:690e:488d:10b0:679:a898:7d8b with SMTP id
 956f58d0204a3-67a0e4bbf6emr1062061d50.35.1792642367081; Wed, 21 Oct 2026
 21:12:47 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261003-dfustini-atl-sc-cbqri-dt-v9-0-52fd8be98dcf@kernel.org>
 <20261003-dfustini-atl-sc-cbqri-dt-v9-2-52fd8be98dcf@kernel.org>
 <CAB19ukEkAOMnPpi2jVFz68GZ_7cwYmNtrBkxnfEJtFcPb7PJ5Q@mail.gmail.com> <atPhE6rF0Uz93qF2@thelio>
In-Reply-To: <atPhE6rF0Uz93qF2@thelio>
Reply-To: sunilvl@oss.qualcomm.com
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 09:42:35 +0530
X-Gm-Features: AclHuK_KjNarSdeGtOiebAPfz9T-Tt_QOkpNIpxbMPcQ9dxWkRZQBbqOt91xNeM
Message-ID: <CAB19ukGGcDgbewvdMf-TBCYSpN3ksvbU_tJSJdRx0-EKb4Ze_A@mail.gmail.com>
Subject: Re: [PATCH v9 2/5] riscv_cbqri: resctrl: Add cache allocation via
 capacity block mask
To: Drew Fustini <fustini@kernel.org>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
        Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>,
        Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>,
        Chen Pei <cp0613@linux.alibaba.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>,
        Gong Shuai <gong.shuai@sanechips.com.cn>,
        Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
        James Morse <james.morse@arm.com>,
        =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
        Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Peter Newman <peternewman@google.com>,
        =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Rob Herring <robh@kernel.org>,
        Samuel Holland <samuel.holland@sifive.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>, Tony Luck <tony.luck@intel.com>,
        Vasudevan Srinivasan <vasu@rivosinc.com>,
        Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>,
        yunhui cui <cuiyunhui@bytedance.com>,
        Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        x86@kernel.org, devicetree@vger.kernel.org,
        linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAxNiBTYWx0ZWRfXz9ZptI5eEz5r
 7M2Wk3+HucjnKMKNdfzY7qjZPVoPgVwpkmasUFw3Ir0OQdAn/H9kN+PVIm4auL2kT03g816Nlnk
 aWhX7CbayO/ATWHkICPt8s6Yc22uyLU=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ad98d40 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=SRrdq9N9AAAA:8 a=IpJZQVW2AAAA:8
 a=jDNYHvWEAysQCaIWslsA:9 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-GUID: PENUF9v13RF2gaI0Uy3733tec7jB2tdN
X-Proofpoint-ORIG-GUID: PENUF9v13RF2gaI0Uy3733tec7jB2tdN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAxNiBTYWx0ZWRfX3Tu/E7L7T0Hl
 4ly1UMaTG9q1GqB59DaotClEezSMLkgluVxsoEUNf/mInLyB+wktIGWlm5nTZWB5520z0Zu8d0S
 PBuM5qfTUTAj+tEdtsgH32GdWtX2bIJTtRH4J9qTQg1HuVqrvdZIaCd/ds7Il77UXWGuc60gOCo
 JDIt9Owi84kQIbX4PPwpPK5wXnxK7LYLOP+0OkIaMfaItW4QAzeJPWsVume90tHcdDjG/+yelQ7
 x1ZjJhGE25pTO8Zu/2FXMDt8D+xkJup8lak45tkyYIe2eGaxnrnACTqxd9h2fZZgxNENS1xumFT
 jUhB/XubPRNkM1meBtoatMFEeHKGT/u/xjF1r1Gtcy3QZj32TANITFJEXC1J6EeBjKehRJCjsCG
 +VSi1Nois15ocKvcLi/MVSBsYuL6Z6AgCujo8rEPMqu3SxN+25MT+6mxqyq9tG7a9/UWjlpJDhS
 EX47Nmr+NEwF42ivb2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220016

On Sun, Oct 18, 2026 at 2:26=E2=80=AFAM Drew Fustini <fustini@kernel.org> w=
rote:
>
> On Mon, Oct 12, 2026 at 10:23:57PM +0530, Sunil V L wrote:
> > On Sat, Oct 3, 2026 at 12:45=E2=80=AFPM Drew Fustini <fustini@kernel.or=
g> wrote:
> > >
> > > Wire CBQRI capacity controllers into resctrl as RDT_RESOURCE_L2 and
> > > RDT_RESOURCE_L3 schemata.
> > >
> > > resctrl exposes a single capacity mask per resource, so when more tha=
n
> > > one capacity controller backs a cache level they must report the same
> > > number of capacity blocks. The same holds for the other capabilities
> > > resctrl exposes once per resource. A level whose controllers disagree
> > > is left unexposed. Other levels are unaffected.
> > >
> > > The set of controllers backing each level is fixed when resctrl is se=
t
> > > up at late_initcall. Control domains are created in the cpuhp online
> > > callback and keyed on the onlining CPU's cache id from cacheinfo, so =
a
> > > CPU that is offline at probe time still joins its domain once it come=
s
> > > online, provided a controller for its cache is in that set. A CPU who=
se
> > > cache has no controller is left out of that level and a warning is
> > > logged once. A domain is published on the ctrl_domains RCU list only
> > > after it is fully initialized and brought online, and removed from th=
e
> > > list before it is taken offline, following the documented safe
> > > traversal rules.
> > >
> > > Assisted-by: LLM
> > > Tested-by: Chen Pei <cp0613@linux.alibaba.com>
> > > Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > > Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > > Signed-off-by: Drew Fustini <fustini@kernel.org>
> > > ---
> > >  MAINTAINERS                      |   2 +
> > >  arch/riscv/include/asm/resctrl.h | 147 +++++++
> > >  drivers/resctrl/Kconfig          |   4 +
> > >  drivers/resctrl/Makefile         |   1 +
> > >  drivers/resctrl/cbqri_resctrl.c  | 831 +++++++++++++++++++++++++++++=
++++++++++
> > >  5 files changed, 985 insertions(+)
> [..]
> > > diff --git a/drivers/resctrl/cbqri_resctrl.c b/drivers/resctrl/cbqri_=
resctrl.c
> > > new file mode 100644
> > > index 000000000000..f10a24761b25
> > > --- /dev/null
> > > +++ b/drivers/resctrl/cbqri_resctrl.c
> [..]
> > > +static int cbqri_resctrl_setup(void)
> > > +{
> > > +       int rid;
> > > +       int err;
> > > +
> > > +       for (rid =3D 0; rid < RDT_NUM_RESOURCES; rid++)
> > > +               cbqri_resctrl_resources[rid].resctrl_res.rid =3D rid;
> > > +
> > Why can't cbqri_resctrl_control_init directly use
> > cbqri_resctrl_resources? I feel this initialization is redundant.
>
> This is similar to what x86 and arm mpam also do since it is important
> before any resctrl code is called. for_each_rdt_resource() will get
> stuck in a loop if the rid values are not initialized. In contrast,
> cbqri_resctrl_control_init() only handles the resources for which
> cbqri_resctrl_pick_caches() found a controller.
>
> The initialization could be moved into cbqri_resctrl_control_init()
> before any early return paths but it does introduce the possibility that
> rid initialization could be missed if cbqri_resctrl_control_init() is
> ever refactored. Given that, I'm inclined to keep the current structure.
>
Sure. Thanks for the explanation.

Thanks,
Sunil
