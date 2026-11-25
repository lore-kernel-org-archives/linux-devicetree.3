Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795612207;
	b=aD6MyCWiTEoztE+qPbT4gsuAYP4RCd9bM0o0wb+6Bx6nJEhT5ZzAUPr9TQuchwe0vuSC
	 Cc2qkH1pv5z3ivf6x9qGy68pjNv4ACYMJbEhGNoVG9kx8ihwUFSjlQXEuukEakatGWscr
	 3GCTmZMqCI4txCyht20ifQgF734lpy8LfH6Lp1vys7b2EuFng5ag8gTavMi5UmUXafw7k
	 TsPwGimQ0zXhN7I5kpLYI62DDu26AWngDsw2J+84qEi/3qwkVpmjSotm4oObWV6Jbj7YQ
	 QlTBUEh2a2BSKV99Aas077y4vtapFjIsnqiULUjmDmrJ5+mU/Atd1Q6y4oF3JUG2PyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612207;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7zYC14kkeeAydLtOuE3dZ/lyIfuyBLa6WSEsS0ZThvY=;
	b=YChCEMQ4pA90wn78fTk0PoyvgTx4frT87Pu+OCFrmNcY30oyQ0WAwncxcb43jS7mRJAO
	 TbE9WVED/+zSVo3SMIh23BWMaeHL01vIVEAkCqCrjfdawv8Cqrmg3j8bLjOpceQbe4NxU
	 tOj1dnPJG9mJsKm5ssIb4HquCd7HEr31RTAp4hSeBPnFK3ryuK07zZWAwpKXGystXpaye
	 AQZ8QnHNct0D9+Jp8s2S6Xm2esHQKnYDIxRUyx6M7i2O0gi/UPh+OzitnSn2lP45LnNMS
	 vY65SO0OcIkpEJe6w0iSV1EV2t31OM5Qnx4hIsHnpj+JXK1HzZ2FEg8IsUJmhBmyIlg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XP1uVxlM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HCTsscWa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F852606A321
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 13:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F852606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XP1uVxlM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HCTsscWa
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9nm6k1505289
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 13:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7zYC14kkeeAydLtOuE3dZ/lyIfuyBLa6WSEsS0ZThvY=; b=XP1uVxlMIAT52RJ6
	U9GJgrDIM6cDgB3qq5Udzh/EG3fWMBTEkexAfef9+HRsup89OlthsGib/Y58NBkT
	3vzJ9UPhFt0O3P87OPZda+jjqojkoPp6Htp25iWkVaHhd5CT88vfjLtXsZW0XEJc
	R00lw8tuXWN9W8qwS3h2Um9zBNl9S0qNUWQE+ZMBdzSqDV/9N+tWyccR1ZKGs65L
	Ug0Q7R+VEJlPmGiML16PG5Lme1zfEK02jbLRu/NyV9ymzRfMrG5e2u129tQOcWPu
	raeMT1soGb1sQfhkbbgRszux6zuqrU8b6lxp8ie/HuTtqah7MUWjQIFyfl9eZgD9
	Itib/g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5qa2ab0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 13:10:05 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd3b9e70f88so596749a12.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 05:10:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795612204; cv=none;
        d=google.com; s=arc-20260327;
        b=sm8k8zAhffi+tQlC6vZTMw7wQY6df1ip4WHXmwg19MivF0WFPreXLi8b3Iak0u9AnW
         bJPTaLoB6EpBacB0oYscjVEhmsboyRjdZYlEXbzJd6gOJIrGqGZ7kDS3r6eATGdbmVmb
         14pM7DpWUmAmFufApn3jjbkXrLC0gwgMUJmZmL+Iore7mUrF7ylcDM1W2VFm1B7MdH3/
         oI30JdgPSyXKjtyMl4sQHCkqScfI1VL/FHoRuRubxoWmd5pD2Gq7scXwXkO1oDjJQRGr
         5m5tInMPrihrDVwEYpb3TGILsuFTvArCqUrb56D2dfJHQOEgeGHwg/wrhhf7yJEAAGc8
         ldew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7zYC14kkeeAydLtOuE3dZ/lyIfuyBLa6WSEsS0ZThvY=;
        fh=pHb8TIamc2E1KbwItr7/ZTaH0XVBDFMakuf0UrawNJU=;
        b=cYQphUIN2hNmUfaMzmKQawxb4B73Z86Eu5DcE6VwM6Ln5a7p83Qrm5tgxBwe1jHIrW
         ESAjLkNnFIaqocL/AcWg1AqXv6ijWt0kl/axwh1ACk2DiFV0p2LuXs7vcKsjv7uoHfD0
         d+kj+WBXAMMMqXuy1BfGwWl3DSpjlg0dMtcBToRQsLNzpJSgdY+bdrnsLBASRlMlVHr/
         1WSYwbF+A1Jr32ekUPqn/Y2LP3BAIk/PMOxxMwLTc+iURnL2jeyyX5EcMnITuG4u4XT9
         JnwW8FUE8Tjf7TvtMwJEUfOjATsiUSb4oBXzJHeiIq2Cyz+WVm2t52NoUl8DvBwggaV+
         p8Gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795612204; x=1796217004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7zYC14kkeeAydLtOuE3dZ/lyIfuyBLa6WSEsS0ZThvY=;
        b=HCTsscWaQ0D/mLUs3YEjnkg5QclaMq1At5oYtldJ5fjwzF2x16N+otkCNG53wwaNzI
         IhdT4WZlYW4Ufm+0ycBj5wnFbKit+0UQv+rUZchlOVytuxR1kznYro7E24+kzisjehjf
         wijIxlJvOZ9ikUVsVWHw4aDJB9fira0HQy/9Xc3tbubxsLXzt/tX4evuAQWofuogu9ry
         M9Y+GIebPWFyr66FAFQOfLqX0+g33k4ho2pGFpjICNYKayzTsdt7W/w3MyvQLG7u47P5
         64ve9mjHkF5Soiy2Zzl7ZlANa8qU0XEKnPuTx54kEX7wEXPlXxC1pcn9/A1091lkKq7d
         MmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612204; x=1796217004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7zYC14kkeeAydLtOuE3dZ/lyIfuyBLa6WSEsS0ZThvY=;
        b=m8XLk1z/O5CCXItR5226Q6hj51rbFmd4zkFhQsMDJwUfPbZJPnlBfhtCGMgKjtk+k7
         EPjyayxMB8MzJQ2MyLFiuEogSB6uBKSO3elsiMcXJzCStG0sqeutxvHzvdVGCJTC+5GA
         BlkobfHeN8Q753vZ3UwIjWhAjIZ02WTdiFKYJVMWQWZy6bVBGDG7DUeBMVPcGvF72T6F
         dSghw8fObcD6uL5fMGnzG1PCpb19WMtE1gVtPI9amVsfnI1IvwmpB0uUC2rpjh1xc9sV
         e75xuDXNlTNMLS44pN1H7nRb2XLz8hbAEMpHhQizT8UJhqR70N8OusttfVcw56P0RpSZ
         4/Cw==
X-Forwarded-Encrypted: i=1; AL+hErGctXmFaBxJqSUmE286GWeRmK4QKWyt/4rlAS/EoQAQKp5HpIb3M85jePLkf+/AIa90h+brxtZQWxdO@vger.kernel.org
X-Gm-Message-State: APuU4Z+UPiuE9xk1sG5GVsOBugZ78L67RRmNO2OYd0tlbJt/pDTmumH3
	ta6tVoxpPw7QttYIhLRJCLcxddcTaJ0pz7cH4oKz6MoFH1UBHbHQQBYnBE0kdGwwkO/VxkjzSSb
	sqYsXNJd7MQUwJj4BhBg057GwswgndHgD2k2BiqEg57IkMMF3uZTaPWQKeU2Q/6QjkEFDBFL7hr
	qkpF8g46Ln0zBbvL1va6FgpJgfIjZK7f4VuxEozdk=
X-Gm-Gg: AZFdTZfOfZ31xqN76iIwJ5Y8MAaigwTI3py0TciK03sYWVXT4us690cHvuBMGPn2m6Z
	MPFXshF26/L7dz4DDE3Yd4RufY2jkqn7LIy4SJwh628edtUDJF7r5k4MLcTuo7CotHgxYwaC33a
	fpFBceYeeyYt+injzkrlmoLbWnAHiZMbTzM64Lm5GiVKZs3zP9yVzbhLvk9A==
X-Received: by 2002:a17:90b:5346:b0:3b3:ab74:74f7 with SMTP id 98e67ed59e1d1-3b41c955bc5mr17028245a91.39.1795612203983;
        Wed, 25 Nov 2026 05:10:03 -0800 (PST)
X-Received: by 2002:a17:90b:5346:b0:3b3:ab74:74f7 with SMTP id
 98e67ed59e1d1-3b41c955bc5mr17028202a91.39.1795612203470; Wed, 25 Nov 2026
 05:10:03 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
 <20261022-psci-fix-v3-1-9ce2133c5659@gmail.com> <CAPx+jO-rMeg8BvemcMUcC10enjt0dkqWvsK+uRwc75rWpLXhMg@mail.gmail.com>
 <CAAq9HC4doEs2v=aW0-tR+ARD8a1OGes8xDi2BV=T7m40YFBmww@mail.gmail.com>
In-Reply-To: <CAAq9HC4doEs2v=aW0-tR+ARD8a1OGes8xDi2BV=T7m40YFBmww@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:09:52 +0100
X-Gm-Features: Aa3M54oxcK6RC0Uj2-RqU1IkNrdUwbjccr03Fd36W2QS4bujwoCnie3WcicoJCs
Message-ID: <CAPx+jO9CHiWfHNqApccUb=srYec+Ep-bupo+iQteu9ZPVZ9MYQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: psci: Add skip-suspend-mode-switch
 property
To: Reza Kurniawan <imkyufie@gmail.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Val Packett <val@packett.cool>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: oKilmgPMUnVhk3elhU5Aw59K8NXJnMxv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX0d/bOtaCiaw0
 eBS+8t22Rf/dLUSqVNIB33ciVvE8OAhC7JW/Y1yvG4l5DN7j6u1ZVo3behwbeqNX5qWdw8JvP2C
 PHA8PMztRto9JwpVy5mIMZHHTZQ6DLs=
X-Proofpoint-GUID: oKilmgPMUnVhk3elhU5Aw59K8NXJnMxv
X-Authority-Analysis: v=2.4 cv=CKu/zhrD c=1 sm=1 tr=0 ts=6b06de2d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=UY4Qpe7uAAAA:8
 a=gEszbayXw1Bg4_vTXsgA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=Dz9CbhmWzz49oM4s8yQO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX4tygQoOt4CTR
 k7iTHs3JbOjK0gox0aJalXKfNddIJkvjZW7j8fTGsxu1HwgQM8Ykg2ZkxBCLfW6uyQ3iWdirAQZ
 MIwFWxaqbtwIQhw1UwxszVp7IiG77Aw7Z13wtQCi0ake2uyjKRqlFbLMaDYxXcImByrUqaSu5uQ
 2a4MHoKD29tbnvwMLBoBUqqEsmsbsY+QS/WGFg1mFCH9HrUNY5+VEfGMtz1SkEnUt+OnHE4pUCw
 Q/Dm3LeS9hln494fmhwJVwww357r9ZKHSdtJTFGd7ttPRZy9pM9iB07yWMDb+v5yuJ+Wlqw3ZuY
 Ju81tS62I767EH7GLOvnNinRg7scl3jmjF5dvGkVvwXH7ywKQLmpZr7KwLH9O5P7RM5qGmQEP0j
 nKo1jxdHy/lLorg0cm0gQvwLMRQ1ziNHZ7xEmOJmzCXp2Z9soTkX8+huAIN7vVibo/+bUVcFZQF
 bQYHLn7BuqpBOqlNxcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250052

On Tue, Nov 17, 2026 at 7:15=E2=80=AFAM Reza Kurniawan <imkyufie@gmail.com>=
 wrote:
>
> On Fri, Nov 13, 2026 at 8:10=E2=80=AFPM Ulf Hansson
> <ulf.hansson@oss.qualcomm.com> wrote:
> >
> > + Sudeep
> >
> > On Thu, Oct 22, 2026 at 11:41=E2=80=AFAM Reza Kurniawan <imkyufie@gmail=
.com> wrote:
> > >
> > > From: Alejandro Tafalla <atafalla@dnyon.com>
> > >
> > > On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI_FEATURES repor=
ts
> > > that OS-initiated mode is supported, but every PSCI_SET_SUSPEND_MODE
> > > call is rejected with NOT_SUPPORTED.
> > >
> > > PSCI provides no call to read back the current suspend mode, so the O=
S
> > > cannot tell which mode the firmware is operating in or why the switch
> > > is rejected.
> > >
> > > Add an optional flag that tells the OS not to issue
> > > PSCI_SET_SUSPEND_MODE on such firmware.
> >
> > I think it would be nice to further clarify what's going on in the
> > PSCI FW. If I understand correctly, the only supported mode is the
> > PSCI OS-initiated mode, hence it's always running in this mode, right?
>
> That is correct.
>
> >
> > This is clearly a violation of the PSCI spec - and I guess updating
> > the FW isn't possible at this late state, or is it?
>
> Just as Val stated, it's not possible sadly.
>
> >
> > >
> > > Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
> > > [Reza Kurniawan: split out the patch, rewrote the property descriptio=
n,
> > >  renamed the property]
> > > Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
> > > Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> > > ---
> > >  Documentation/devicetree/bindings/arm/psci.yaml | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Docume=
ntation/devicetree/bindings/arm/psci.yaml
> > > index 0d04389c81..2eee38d155 100644
> > > --- a/Documentation/devicetree/bindings/arm/psci.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/psci.yaml
> > > @@ -98,6 +98,19 @@ properties:
> > >        [1] Kernel documentation - ARM idle states bindings
> > >          Documentation/devicetree/bindings/cpu/idle-states.yaml
> > >
> > > +  skip-suspend-mode-switch:
> >
> > Maybe a more descriptive name can be found?
> >
> > osi-mode-only or broken-suspend-mode-osi-only?
>
> I initially settled with a similar name before (with 'osi-only'
> phrasing). I ultimately went with 'skip-suspend-mode-switch' because
> the root cause was only due to the mode switch not functioning
> properly. This property doesn't do anything regarding the mode the
> firmware is stuck at as it's only fixing the failed call. Normally,
> the driver sets the PSCI to the preferred mode at driver probe (OSI if
> supported, PC otherwise). This property simply skips that part and
> assumes the FW is already in the preferred mode. It could
> theoretically work for firmware stuck at either OSI or PC mode, as long
> as the platform shows the same symptom, It is mode-agnostic essentially.
> That being said, I'm not completely against the 'osi-only' phrasing.
>
> What do you think of the above rationale? I'm open to suggestions.
>
> I admit that the word "skip" here isn't really helpful since it counts
> as an implementation detail. "broken" should better describe that it's
> a quirk.

I guess "broken" deserves to be part of the property somehow, to
clearly indicate that the FW do not follow the spec.

People have different tastes and I have no strong opinion in the end.
Anyway, I suggest you to respin this to clarify the commit message and
to suggest a better name of the property. Let's see what Sudeep and
the arm folkz think of this as well.

Kind regards
Uffe
