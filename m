Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA1D39E184
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788159677; cv=pass; b=tDExLJ/7AUD7AStdboe3GoU0sGdFyxsWrXNvFrVrV+9yrsXkly5oYdIcNib/x0DICAaxksQsT6XqDrmVMF1+XTDzpU9Q8PuJhmrqnBV4OXG+p01tENfC7CDcSJoIfoq263aUI5qtElmephGuAGBsASDVItPebcOO09YIzOYNXQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788159677; c=relaxed/simple;
	bh=mjz3VLkoLmNm493egCLVUmw1zCg+c71kvqmAxjQBT3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jlFRqrkfrLudWeQdRCiFU7PBpk0ESZ6gqF6jPxHGd1PHNlvC8s4FX0Jgj5Cnbm5uNBM4095P1be+KFWlUNFWhKPhJrUR+vgfL+HtHEnhj9k5VvnDdfuGjULW9WmWjw7YvimbFWNOuQw+W3FTGGPth2qjZIyYM7B/nN0zJh5D9pA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ADbV7gF0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KBaGzU0B; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ADbV7gF0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KBaGzU0B"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52VkR2423231
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:01:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mjz3VLkoLmNm493egCLVUmw1zCg+c71kvqmAxjQBT3w=; b=ADbV7gF0JLvS8Cfm
	MbksJgGLNSKI3xxGjotgVWvM+q8epb467QICaXLotIyYrv99Y1alK1gSWrH+9s5l
	/90iasfhS4zbr2buBXBnrfuEoH4lc1q3SH2YOMpoMSwXt54vqyMuRnlsEXfhPKTy
	AFhGjQqBwz/kXLuZ1Yq+kDsC2rK9QdcF2UR4E2+7GnoV4iVec6OORZn6kNYOjTA/
	3swAnPDtX1XRJvyA2wVQgMRrgxZkWbF7q+tduldnVPLuaoLSNKICnOvNRLEIgzqe
	l2zgAqscYDB5+5MR6bNgxfSWqkPokSfcMB/mwoTRoNqAZgO9ak6S6NXnC7srbmHJ
	47yNbQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqe2d2xu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:01:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e11baa66eso5343590a91.2
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 00:01:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788159674; cv=none;
        d=google.com; s=arc-20260327;
        b=OQup+vvXQHjGyTQmyUHWlW/sAlOpGH9xsREoY/WUOJrWaDfhnqifLvXv4Bgr/ASrqB
         g+YSiH9naZvL4THOQ3/Y2i6iJTMvN/mrW0M5n+zwELyRfTrOnX25bpX4ikNhpMamcZ/H
         lgjTf9j2hLgqMtkBpNHD7Gmz/C6wxNFLPhroKb21cCpJWODY+fYHYEQkWtJyzvJXnWzw
         yFXIn4ueEsdrCpXOihZnvChGWYQPMlS7YFbOUZSXbddMvvpt/cWZZ2Oy4fqeR7lEfoDN
         VOvf/PEpvgC8uC4kQ4wpC5psuut7hjZX/nSephC9nzDL8fGnOONuNjEXdQJ3VWlMEDQ7
         nZgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mjz3VLkoLmNm493egCLVUmw1zCg+c71kvqmAxjQBT3w=;
        fh=SubHWPDCMSgyIhtt0AToYnUwlcT/dMPGrnIbCiZXx1A=;
        b=PoVHxS2HpmxeHw7A5a2YZUnUGmJa3LpDmg1Rt2GV90cX2zf3elpU344JVNdgOSPxEp
         P1djhtMYAKp0RNREfF+hipauUmbbU6SQoeMepNm/HUXXu9gTyVPCGN98qCUgLgqS9lh9
         11T2S4K9WaECx9qo9seQYwqcNuqT2EWDulL2SFgATuvM+wyK/XbUqrgT2u6J13s+NLyQ
         p/+PtrHXog4Pek/I+8GunQFlPzuMRL8kt7w137Jh0CnnB/0lywntR5w0b8qYdX8BnnPf
         j7JNEcTh6hgYm+OMB33zpP/UZ9WDxrreFoJFRwm7Eeh6XSTm7xGF2Maf4afJlST/D0gh
         bhmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788159674; x=1788764474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mjz3VLkoLmNm493egCLVUmw1zCg+c71kvqmAxjQBT3w=;
        b=KBaGzU0BYxRS1Jzcn18f9TvHtYXtDbrs3Axxmy222bTtUT88NS56zc52f2qFltqYCb
         NpNcDuE7hMty1Y5j376RR80THwZ+g4L9onCjz2I940/vtJXNDosyXgrmt8ZfD1jpx5jl
         eAzzXw4ngA+vy7q4uYRRuH6oPjmpEF+EWo7vtTsw2VPAzskm/5YsB3a/Bmnoh/3Xvizy
         W5YemtZDRVcMOK0aCAhaqvSq70KN5tkmsSc7Ia94KOLDfBwC4NdfNvYhgNof+ww8Kn7t
         DidG5KhmnDwbpmmYkSYtRCOEqMqpDRyqjmbCsHi0VnLsOuKsYpp4UOKQl5TFr8h/TvBJ
         PnRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788159674; x=1788764474;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mjz3VLkoLmNm493egCLVUmw1zCg+c71kvqmAxjQBT3w=;
        b=WyKmtFjWLhGAoN0whoO7eqHJQZNseNyVAfy/iZIMbXSTNXNc3P4d8+E+4nC/5Pv12R
         2hSyz3Z4YYqhit0YH+mYZHmkjC3hoPBbkWpzbyGov9XRn0lNNq4Es2lLKrn9LGozR+gh
         VaZJv4KMyPhFybg7nbCUNZpgdtk+E7T3UhWeqbd7zgDSm6C3sT8CfNrFIbacop3GUYPh
         46Xd5WncQlJ2203uG3BeGsnZ34MvgNGV+ZofVLU2fsqLqN9b0ZISSrHCHGl44SgJEx73
         0YrE8r3Cd3CHKYi/z+2iv5KUmfkf2c/FLBxQyJaD4R61XSOjnpc0DC2zoGqN1wf6XcAc
         cC5A==
X-Forwarded-Encrypted: i=1; AKwUvBxZ2RFDEIYPyTUVF9pKlPqfw9d4YFFT7tzb/J/ywwF//qgsvkipnrssKxYXWlA7Bxx8+GpsNzjg4gp+@vger.kernel.org
X-Gm-Message-State: AFuF++kk46ctb3uWpFk2T7DlJOY55LNQHoP8zax2gkNMgRmmGbzeIcI7
	gV/M/OirDeTfSe7hcmJ4b8i5cWA9/c9hLtr9cNz4PmtvEYoiSi1dB7L7W6FysNrSjzhFN97LaJj
	xr/XeTdXoYzQJEYXGkw/dG5jj3b9cqsmbNTi7MYMXMJNNMnhUX5Go9yhWOzMmX5r5GYdr4iI5Dt
	3NMaVm8ZLYei/MYhrplcMgoG4WIfyzqw6gwjdQAJQ=
X-Gm-Gg: AYBFou0/nFwjvA6EH08nHD41BLP1+NWKav4ENSuFgbRK8saLrv4afRz52iQanSMFtoN
	GIitlAo/kivd0H9lshjvTRNx+n2YaYIa92hCXpl0KQGWX22OPezi0nvgssYUoCMuUhgAaOhDxlE
	yI1yWYQUzVgapd0Es0xn5DfBI6kLaQgirXJeDnMMgZcPs2NLmvGE1+/qIfP+Q=
X-Received: by 2002:a17:90b:4acf:b0:398:b17b:3bd2 with SMTP id 98e67ed59e1d1-398b17b3dd4mr17738480a91.4.1788159674266;
        Mon, 31 Aug 2026 00:01:14 -0700 (PDT)
X-Received: by 2002:a17:90b:4acf:b0:398:b17b:3bd2 with SMTP id
 98e67ed59e1d1-398b17b3dd4mr17738374a91.4.1788159673614; Mon, 31 Aug 2026
 00:01:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817160222.3313295-1-mayuresh.chitale@oss.qualcomm.com>
 <20260817160222.3313295-2-mayuresh.chitale@oss.qualcomm.com>
 <20260818-hunger-module-a44d9716010d@spud> <CAHuiULBGKCqxMzO7f-i0VeuN0nykEaDwzVzq1VtT5VK2LM3eTQ@mail.gmail.com>
 <20260825-mahogany-reminder-e22b34a405ea@spud>
In-Reply-To: <20260825-mahogany-reminder-e22b34a405ea@spud>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 12:31:01 +0530
X-Gm-Features: AcwNN1XDZ4A5hLcyFgra6kVvN3M13-5kLgxPTlWatkTDhr3XPE_BrCOk6BTaEa8
Message-ID: <CAHuiULCeHydeg2e8vreq8xHcrfH8ium+jG2k6xEwWX0UEp+8zA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: riscv: Add Sspesa and Ssplcofi extensions
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Guodong Xu <docular.xu@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Deepak Gupta <debug@rivosinc.com>, Xu Lu <luxu.kernel@bytedance.com>,
        Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Iskutr/g c=1 sm=1 tr=0 ts=6a9526bb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=37CK-rImlAPP-qB_EOAA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: GiJgy1H7zbWiafsW6GZK9MNS8g5SFc-u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA1OCBTYWx0ZWRfX8iMgmxCVAbfr
 xqWbRhM8GUNgJSW0bOKnCh/V7wWuHaC8gYZfFlaE9fKi/jm1Swcu3jDQ8tTF/jR2dqEwqYAIyfY
 u2Ny4FogbMit/hRdjBjW2upy7DhcYEKPYSVNgQAWAshnnVs1iMO17VhXDZ6D6JdKw7k8qnDcVUK
 45MWw+GD8p/Mka0G4AgvXQ6aDbku1J1d63PLqdfepQQDNq3rrwB7wq196IMQYFj7iWkfoJCedj5
 mz5mwpwEbLp47qDiI/SmhUFCTqfKalIMntVgciF+gHKc8gV25jwXsoLrQ6XXGF3RszYIRFATu/y
 J2SjQ5m9ZSQUxlJhhV7tdrDxvvc0ukHnUPaI10rwnzpBorH6N/XRP8PSrYwqz3a9sCpLme8cngI
 PwATF71ejMMDAlETgiT683iNbZUyC3reaeUgqdCAYYFoSKMzlstvByopzQ+FSMii9PnaiD9BPr0
 cBuuqHuBF2KuvUWqdew==
X-Proofpoint-ORIG-GUID: GiJgy1H7zbWiafsW6GZK9MNS8g5SFc-u
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA1OCBTYWx0ZWRfXz7TIVTyJVgRk
 7jXyOU+E/t4Z3uOvrI4GvingcfdM84GLXJgMfAia0xITPwVqirhxJvqQW+g84Hnk9PaUxYUKQMj
 nnE36JoJ3N9IoaPovoTW5ZDY+VXRa7s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310058

On Tue, Aug 25, 2026 at 10:12=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Tue, Aug 25, 2026 at 06:46:39PM +0530, Mayuresh Chitale wrote:
> > On Tue, Aug 18, 2026 at 3:05=E2=80=AFPM Conor Dooley <conor@kernel.org>=
 wrote:
> > >
> > > On Mon, Aug 17, 2026 at 09:32:17PM +0530, Mayuresh Chitale wrote:
> > > > Document the RISC-V Performance Event Sampling extensions Sspesa
> > > > (Precise Event Sample Attribution) and Ssplcofi (Precise Local Coun=
ter
> > > > Overflow Interrupt) in the ISA extensions binding.
> > > >
> > > > Add a dependency rule requiring Sspesa to be present whenever Ssplc=
ofi
> > > > is present.
> > > >
> > > > Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> > >
> > > Why is this series RFC?
> > It's because the spec is still in draft stage and also the register
> > addresses have yet to be assigned.
>
> If you send more RFC revisions, please include this explanation.
Sure. Will do.
>
> Thanks,
> Conor.
