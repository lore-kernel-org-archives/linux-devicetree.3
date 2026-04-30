Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6387441B37E
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 13:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777554811; cv=pass; b=kSfI7akya9j8IThEuszYxCx7Y5z5hP+uW+hFEmTauPIlUFiIsnMdDm+JZovelZi3Xwo4PPBCM3bXqWhuHYZUrb+EfvaEyTrSqKijYsDWrzRCTSiwrt9qrCZieqfC/0w7kO2z56p9gSBGBkGRbjbEDPdY3z7wQmgUa+balzspLvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777554811; c=relaxed/simple;
	bh=uOBwc+Vl17MdUv77w9tKQsD4/qPdD6T614WQexS4A50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A/YBluWoPrliUg54KelWL1EaLJbgYcQ2B7xXInyAnMvunrJ3gS7IXI6fyNWTatgv+MdGKL5phhkof2RVAF4JTPmcTVE6K4VuHW4jzDsK/d755gJCUCAN+TbplhDcWhalBnO1JQ+tdBokSFLda19vcDK9W2V8iZS9ZlSapMuog6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wv4+57bH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FwcyrArf; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wv4+57bH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FwcyrArf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UCF3BK088536
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 13:13:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TouSduUFbw2zfEHACuqETKI0j08FgYQyPnYjBVsGXhs=; b=Wv4+57bHKS59t2pn
	l788D+Bh3SNVywmZLGOHfFpV5gix7UmN+Hbdo/rkaV907faoB34D6MoaRtws6I/F
	v30P+s1u0dEaN27jtCCPCVVP+r7L4EEy0FvbN7cRN35CSHU9XxqTb32ZATl5T86t
	UrmjKIcb1J8hNdRzni/k+tZLpRqGXhoJRr92bkpFOWRdgTmqxOYvkyjH1cO6GXnx
	iRe4KV/oP4i6FXY0oe260zuknkGUSwIURJlJbrNK3gxPYKc7iPfxfqQqhZFkUzNG
	0yB8b1v+rCFij5Gpwopcwf+oxHOaJvlbverrXg4+0dPQ0rN+GBwkFpQ3zascOloc
	t7rLFA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv2u41k6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 13:13:27 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7bd5c9e1826so4161567b3.1
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 06:13:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777554807; cv=none;
        d=google.com; s=arc-20240605;
        b=ewtXWZUPIn3Vakh+DZNHvq7B6oIZZvxThvXqA/MD4uDhLpU4aC1hYAASqVZyeUxbbf
         lqecPMYMwM8ntJCY8rnOTi7TjbdgyfZHVKflw4ehXrTNhWev3mejsdr05A81BKDNwCHe
         4nS2ZeGJvBiDEl+VXL8eIOEv6IkIF/mo9NKY+GOK/5aQrKaign/NbPdSthaQNkdE0a+W
         apcP7QtJ8V+FL9JAtn9TQH064Bk3jp0nmPEO/0eDC/DlOMOA0BjsjfXzDQSxxBr46Guf
         se4k3J8wPtiJ4g1uZvEeXuCVK2v+RmBX2ubnmzh7VUDo2cXkTNKE19LL3klWsRrZ/1Di
         EFWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TouSduUFbw2zfEHACuqETKI0j08FgYQyPnYjBVsGXhs=;
        fh=nzS/aB2R6MCNhR+UUz8oGehoNOk0u5wDWsbSGjflTVM=;
        b=ZFS5W71R4FG8NTKzX1Q8thQDXAC96LrwetZi+s+4AjjHdVskqfivs3Zp6jPdUnDOpq
         H3wQL6Cg8eQxDWdNlwPHZ1IYaFwFHQmCYAY1Q3Gjmy8fq7QiwY0fpZkU6F+4LZtUqyNO
         5OiLqk8RAbwX3hK+0bvH+IE4FPRjwO9wyYgCnYl6C9/KXVdvQREabBb9slciiYESdnBS
         +WpCn+kbRGwZgF/geoe9ikJkHTUw1Zwg0klM9lptM5lumLqKF3Y5KsjHI0owTD2afiBb
         ZrtUT8tP0eRJVqjQj9pzWdjoxH7myhKWIdQ9RptRrQVFUdWorOL8ZdwbKRh6U4oGPO8k
         l8pw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777554807; x=1778159607; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TouSduUFbw2zfEHACuqETKI0j08FgYQyPnYjBVsGXhs=;
        b=FwcyrArfxVUEmUhB3u8Cd1zaLyprWFV/8QsAGr64S3i1OKV1YWT5ge6d65LkrBgQtj
         i7VvtXz4aCnaUNAKiQA9yIRIXzjfEDIZTvDcxoq+VaoSJx7Z0sngsyGGBstj8Zvk3Feh
         kPWTRxJ3uWdlF7uGPCQIIJ9C1SFAWMCMuvsid+MwkkbpU6eefPGaUbvLCRJjnsjgxu0x
         3lLI9mQiZy3HPWt8t6c/kcOEehIRou+EqkUsyxNXO1QEQ+p+8pLFv4Pyjak72Qz8q/d0
         VkOwBvmM06nD8NE6SpVnDntC1KIyiiFErPPHhQmuZfcxGiVvQiTSqraGm/aAFjVkqurK
         oXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777554807; x=1778159607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TouSduUFbw2zfEHACuqETKI0j08FgYQyPnYjBVsGXhs=;
        b=EM3psAW5v7XleVCkd+4RhqJuPkGklxbO3NLLj9E+z9MGIlkBsv43ze50Lskvvnf4Bu
         SRLXMUqvbpyxqjartCmY+i0z3sIWctwmIvGR++mb2vFM8wFDmoe3MlGqEv3JlITI/bFc
         WIGwip7xcIqMMj2Y3vdIhlOwfbXMdGsDgl0oIxnCDXqcAX/1ZhtkuY1eDbjCgArEjMbm
         euIZEziKSmHo4dmTgTYEMLAT74Z5gJJSNiAW+N/EHHQQNK+5bAkVGi4MSO3+KC4rosAJ
         HwzcdXFAZf0gCdAb0fJ15dzve3kKulAMCQlAcsFonO9YOgvpo1+0Xbup6x214/qbV3qH
         mNTQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ckfbFrhdhlQa9J4mLBTtcF1/pBqVl3/Q5Q1nHIvALinnsD7dmTrf2A2gDsK7v60yjVMafu2Iu0qjS@vger.kernel.org
X-Gm-Message-State: AOJu0YwB97ztozYZYohD0G8mWCXLVa/kTNNjwlmp/RUCYVcGBn79I2ru
	TD/YEhNqii3Ah/YR8v8TbLezEQh3qAZm0RDFJqIcm5mHOpTs6jl9MOntZod7wKn/59mZpO5a/JW
	9u6s7VPfjoCaZu6GntmYTfNHZi9NFOEkm5rDIgFnhw/vOih8uRgr8lj7IsWsSy2L8CYGx3mguc9
	YbPs/v5j9vBXx6bBIZH1pGE7BveSkFpK/Qt3XCDK4=
X-Gm-Gg: AeBDiet4cL0dxSw127wI5wGbCxJdCphwJOBhxZVv05HmX3dVhougex6YRrE22vAa1BX
	OhbGpPG0v7PFP8U9JmISl4xpye14eR79jyG4KoO8YftGZXlHh9rP49n26yfJcWZYn+r4c3BFBCG
	0SDdcK/6ZIZ5EZudentcZmLzP4Hu/umIQid9y6JKO1Cd/ZcC+YqFuFDa32iV5aeKWUgHsp/wZtX
	WOFC55G31/urVy5SYKPL3F4JSW4/xUYD7dwX5HDYKHjWGRPIrM=
X-Received: by 2002:a05:690e:4299:10b0:650:ece:89fd with SMTP id 956f58d0204a3-65c1b0a4185mr1181516d50.27.1777554806656;
        Thu, 30 Apr 2026 06:13:26 -0700 (PDT)
X-Received: by 2002:a05:690e:4299:10b0:650:ece:89fd with SMTP id
 956f58d0204a3-65c1b0a4185mr1181471d50.27.1777554806063; Thu, 30 Apr 2026
 06:13:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
 <20260428-block-as-nvmem-v1-1-6ad23e75190a@oss.qualcomm.com> <20260430-bird-of-sheer-ampleness-744e7f@quoll>
In-Reply-To: <20260430-bird-of-sheer-ampleness-744e7f@quoll>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 15:13:15 +0200
X-Gm-Features: AVHnY4I6bR6fdSxJnXBrJdTY4FKOp8Nu9g27U_d0aw_5w0XdML8zMEtBVrvqIXA
Message-ID: <CAFEp6-25Xad_LT8L-HPpOpXf7j1S=Vew=iSgxEmAHd_on+jkcA@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: mmc: Document support for nvmem-layout
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Ev/iaycA c=1 sm=1 tr=0 ts=69f35577 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=Q8QnmAOcOvJ-T5SqZIoA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-ORIG-GUID: kQlYK7UsssRnvhbsN_eJwY7ySz-hnAzl
X-Proofpoint-GUID: kQlYK7UsssRnvhbsN_eJwY7ySz-hnAzl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEzNSBTYWx0ZWRfX7a702EPeHEHI
 K1lBkzim0Cw8GtuLlUIsxO9N5RgsQ9HK81Wo2tcON+Wd6Ue2vGsXQ3a5E2VM/KDxY4wk2j3qsjZ
 wdl1JgJGvdC+Pszb7d2/+sHTJUAK0207qgiC+Ze8xd62k5kMulf26FX52KVyJBek2W8R1BzGseh
 E7U0UvIPCxv/sJyqVZ/k+VxAkDqx0R3xSdXRWGy3b7CtGcdExpVyT3j82/Usnc592rlr6Sbscaj
 Heedy3vd0P/dkzvTfgmjUPfwMlwDn+OLFhbUEl7IaP+exADo9X/2oEW1Cj/BZQ51GCJpfpUWNkR
 UealJpTj60JCJTdbz4Ipu9YA6prVfhgWeXie2+3tNf+NJMMV/+HWYspT69NUQ2/2Ws+snDPtyj0
 hc50kR1lexaCyJdCE/NWjrrbpdyEHgp3CUzZwB4b4eyOM5eddaVRmAmpZI9OIR1RN/fHxuSfDTZ
 MzlSrtweq/H5VKB8xww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300135

Hi Krzysztof,

On Thu, Apr 30, 2026 at 11:59=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Tue, Apr 28, 2026 at 04:23:06PM +0200, Loic Poulain wrote:
>
> > +                    compatible =3D "fixed-layout";
> > +
> > +                    #address-cells =3D <1>;
> > +                    #size-cells =3D <1>;
> > +
> > +                    mac-addr@4400 {
> > +                        reg =3D <0x4400 0x6>;
>
> This looks incomplete. Why isn't this mac-base type of entry? And how do
> you address it from NVMEM consumer?

This indeed falls under the fixed-cell/mac-base type, thanks for
pointing that out.
NVMEM consumers reference these entries using the nvmem-cells
property, via the corresponding label/phandle.

>
> > +                    };
> > +
> > +                    bd-addr@5400 {
> > +                        reg =3D <0x5400 0x6>;
> > +                    };
> > +                };
> > +            };
> >          };
> >      };
> >
> >
> > --
> > 2.34.1
> >
