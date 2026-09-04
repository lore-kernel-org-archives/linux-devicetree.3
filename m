Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3CF3CB91E
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 07:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788506267; cv=pass; b=hRxpyRJzyox7JSNAUuXIa9CEq9/HqJcRLYAKnpuwqgMNtzFzaRkzZziDAHjiXhSnuiGUPqudmaQkq8c6azLAgAC2dwtyBb2HSev+CtLUMCPq7q2kt6q05zOEVOGW+Qg5eJMdhxPeQY79V8j3v6jgUr5KIiAmfPbJHai4h/iIl9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788506267; c=relaxed/simple;
	bh=J8dsPnAWdboF1yFvJDLhBeE5gRfGXjP3682VM1Iqx2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lhp+2ZUUZroxsYm7QiA4iFrbgOSVR3JEMmpWjnz6hVCGoEjNxrUCJlHBjWnpfQEpBx11Qu+JMly0DGz2bbKCZ+alce9hr6l47+sMUh55SD4N3UrZ7/s+AzlHLe/Y0EbZaMYo7ohPi38YaSTlRzzDQ+G5oPWSqiHzGzUB8etBhUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OI8FT8Wh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RBU6TwfX; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OI8FT8Wh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RBU6TwfX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68462bK52611885
	for <devicetree@vger.kernel.org>; Fri, 4 Sep 2026 07:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LB6s0B651lSSZ12Sdfk1hENNUEaAaUZ9od/XOsIo4uY=; b=OI8FT8WhAfwVk+ZZ
	8T5wxyqpe708tolnXc/VTkesfR67qqX1vGQ9RxJyEyTCl2T5XFfW8RIeogaCL5Zt
	4E/omkikXWrxxm+RLQRXjGY0OlJQ2lKWJX0g7LtAZgVjohNaB92hYZsfdUHcte/P
	SBndiqT6076Ry6JMFdRQyA+2Yf7A2Xx9N0ugFAnnXxcUTJ91+wZlVx8as/ZggFZl
	TmagoMORfsZZj+pAc6bU0p25PSM7HrrM0tq/Hyx/iBXiNcsc5oY0K9+La/nYnu39
	XHaTGr8kOkiuMF9F3RftxWTB2ENwvtQAqCyEA0/kgNGd5Ouwb+M10AzzU4CyC56j
	k3HbZQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfqqtrc9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 07:17:41 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc21bc2923fso1113043a12.2
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 00:17:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788506259; cv=none;
        d=google.com; s=arc-20260327;
        b=YD5/wPMwfZndl/QQbsJzclV1quk2zlF0nKAY8GNBN84j2X0Vmkt6Iz6bkiTgSfd3tX
         SDBdYjijcb8JqfzzLmc7kdddZdUSuOJ/Nho+BaGoO6SpE74bxpmh7KsCsz1jmGLV/TTF
         DTuz1gxN4Z8/cRUg3qNX2vKNw3zgzWeDYZ0K08AcJIbDD5hEA3kD+ktE3IWHLrc6COjx
         AmS2Dsk2UuHwF4JBdtLIrL5KPATaYHoo/PmXea8tWILBZDq2jD9+7D7Tdts+YrP6t/kO
         x+eTG/7FGSVOomu0sxw8yXT9d6H9JouTEejsuuJMa8NCnaDn92qWba8hNWgIPI9NTZmt
         rvKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LB6s0B651lSSZ12Sdfk1hENNUEaAaUZ9od/XOsIo4uY=;
        fh=x48k4vZKIXiXZHEvUGCBM9n9p+GRJvKZ9bKd5mXYgV0=;
        b=Yr1xNn88pdELa3mWdg33f2NSc6zpzJAvOveo90AiULOEorJW3MUPz8+mnwHPBDKqpd
         PW3u7uKb05UjiU6HM/gCyBRFNUsyVjy+6Oy7k+SqyY0l/wM3qeLCAjDkW3VGPkjPSdrF
         3YHNXVgTjha5Rgo1gsDIlYtuHrWIJLHC1/RTaU7xGz1pMKzAZjF7GaGPJDd7oMu93FqV
         WjrZs/3xM8gIke1snJ3zTvtVfoWqV5pOhYDNyqfv8So14h/+rA3jebBvZnPuA1rX6fMh
         qV2eCNG2257m2tUD6UEYlQwunX7EA6DQT5kUebSxkSTY4Mf+f38S/YiTLWE9KkHsM5v1
         hJyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788506259; x=1789111059; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LB6s0B651lSSZ12Sdfk1hENNUEaAaUZ9od/XOsIo4uY=;
        b=RBU6TwfXHXEf0ViP1/vW8nLVlhvd5ncNWxGvYvaloSHaaUQ86p7AbM/HkFV/cIe/Zp
         5CdCAc3IfDHvXFvj/T21hFdpkDDCjUIdL7nQXguS19kokTgxZuSdKKvHZTb4fAMPGRab
         4fRF9COHX8Q0l2UY2N52d4YJGPbJ42csIOFT0mKCFDMGD4pfX6m+3vuQJT2tzZCZiv4j
         /Av5uJgUmvJ5fppY4W12hTJYkYovF5tmOY6MmG+LWDO320zwJqOOP3vtZVNZ40Eu5S0b
         NYCiibzxZGT/2l7QxyTus6R//8GqL7/8K/NAEcp9vcNi8bMbdo4gcAs/1XXpdHkKUDEb
         GcmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788506259; x=1789111059;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LB6s0B651lSSZ12Sdfk1hENNUEaAaUZ9od/XOsIo4uY=;
        b=nH1yGX079sggB70zmXnwnGhCDQqt9qxkLRUTqhIiPk1WiZ2v4nWmddiYXynIthUKkQ
         0EPnXQFoT/+EqN7MV9It7Nhur6+0MfrRFtFS2tizNpNbTGqxUcRfsTJRhV/4m58SBcG+
         l46ylhsD+GllPh6GnIayx1hr5TwPSGBR6Gz6kN2794Hq77sicKxGTozyWtsLYyOnGCre
         cZ5WdJHCZClSIV+tbHHEPSht/iUeeR11ezpqJvpKZzBwkoI2Z+QPFn1Kg01JbI0Fn4wq
         hpQRgb2OMskSpz99you3H89sGnaSoAFprnWZWdwbKw8Uu5L3/t5PHoRnzOUlho6/HXkF
         Gc1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzVj/pzTknj1CKHcfl0mJ+TSlZb84uJer5NwvbLITtiwvEmkvbXQibbjJS7rh1xPBvLqpjtb8xhzv0Y@vger.kernel.org
X-Gm-Message-State: AFuF++nTCVKmRSpZcL7aO2EWZMyZEIyjZgseHpxdWYBX5BZAKq1Iy+zD
	7RHhYq8hBPPBNcvA0FlZwKAZbKepTYZfdYja0QNJiqalZpBDlGKLwBgFZBKT/1UKi8qu0XxUcHs
	dyVmW90ztc3ej7nanjk4oLwfWrOX149ZC9RrFx9gF8pWKRBc4SAC2U/KMyONNz6yK94M0JuArJ7
	kAUokJskRtK4SELMifKne6XDFj5iB1hsIImSg361Y=
X-Gm-Gg: AYBFou0LviXJkx7FbLKdnL+v4QLjI5fz54LshiPRoHzXzgY9lMtFH9P0MgA14rF2wHC
	JL3F4xGPy9O+TwEyLhomgrNpZ5sbViLrQOuA835D0Afj5s2E0ZYB5LTBAlZDEe8kD2+jrBOQz8v
	D2F+ajSgCqy6mM5OkKINv0wVyWFBOhlnwFO+SjKUKtorXjKxsBzl3poclB3A==
X-Received: by 2002:a05:6a20:7290:b0:3cd:9f99:3381 with SMTP id adf61e73a8af0-3da39878551mr5927930637.0.1788506258720;
        Fri, 04 Sep 2026 00:17:38 -0700 (PDT)
X-Received: by 2002:a05:6a20:7290:b0:3cd:9f99:3381 with SMTP id
 adf61e73a8af0-3da39878551mr5927876637.0.1788506258295; Fri, 04 Sep 2026
 00:17:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260903160401.GV2133376@google.com>
In-Reply-To: <20260903160401.GV2133376@google.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 09:17:25 +0200
X-Gm-Features: AcwNN1XLgC_UnHcC1VgAAx4Zjez2ZZ2qUdiBHVeX_BYEXGU9Ghy4hb4yt4Luazs
Message-ID: <CAPx+jO9Hi2R_UnCEhsXLwf74c3RTb+RodaJ6SOVXbQX_eHt++A@mail.gmail.com>
Subject: Re: [PATCH v24 00/12] Implement PSCI reboot mode driver for PSCI resets
To: Lee Jones <lee@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=YtA/gYYX c=1 sm=1 tr=0 ts=6a9a7095 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=RfyTg-q-OfOJAL476ygA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: O3CiNmYahcVobC_AOD8D0qp_hifLgbOL
X-Proofpoint-GUID: O3CiNmYahcVobC_AOD8D0qp_hifLgbOL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA2NiBTYWx0ZWRfXwJVoyBa89dYa
 L6Eo2Qg2tAwWJ5xb/U2ecumEfx30brLz2TIWj7Yvq3914DqPhKfqRCVAahbRDWFqRRzAZSwVn6y
 Uypx+7/Yq+dqpHxiGyQS/f+mJ1qt1Rs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA2NiBTYWx0ZWRfXyJgplOvL5VXk
 Sm5rgBmdGqwU297PsOxLWu64L2biNd7wQu9x2bwbnPPw8EtPaSUeYbyl4GWUMhOin3TeCQQnz57
 hiW0bIithAlYU4CyHBuzIjraBTJyyz2FmTVOsKtU3PYczVSkLFg6uwRa1GKcMhcL7xcR7xDOsJt
 6pZA2Mbh4INaO77duDHGQ5whl5BeRIp1ENJRmTwCdNgYq+zRc3W2bNehsJ7ytsX7cvyPZeM1gdP
 7dXjeyUG/E85uIKxm7tCXY7ZzqdQ995IUFrrh/ifL6KhaIuIYPdkkzvKRaiHQ2L932jPE98gYvO
 j0ImvaLDnpxhXePCy6unPzI5IwXm9/NehAZVsp/O5Y6gJqSKhbi1M5M+eGlW/3FZWJ0S0EZe0zF
 4ISoAd8NjyWIXOyhQ3hvibS7JMgVSaZcLVo6MXme//4rNHuNqOWAsfiy0vEcS5CzxjTr5qYs1yS
 02RCNvZu5+4UmK6dcwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040066

On Thu, Sep 3, 2026 at 6:04=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> On Mon, 03 Aug 2026, Shivendra Pratap wrote:
>
> > Userspace should be able to initiate device reboots using the various
> > PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
> > patch series introduces psci-reboot-mode driver that will induce
> > command-based resets to psci driver for executing the device reset.
>
> The more I read through this submission, the more convinced I get that
> it does not belong in MFD.  This is a potentially nice "architectural
> workaround" if it a) didn't break some of MFD's fundamental "real
> devices only" rules, of which cpuidle and reboot-mode certainly are not
> and b) didn't require a massive expansion of what the MFD core is
> designed to do.  I am more that a little uncomfortable with the 150
> lines being added to MFD core support this workaround.
>
> My best suggestion so far would be to base these changes inside
> drivers/firmware/psci and use the aux bus to communicate with the
> various components.

We had some off list discussions about this as well and it seems like
we are in agreement. What you are suggesting makes perfect sense to
me.

Kind regards
Uffe
