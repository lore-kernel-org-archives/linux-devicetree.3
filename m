Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBEF509EF3
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 16:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784974; cv=pass; b=oK1gEdCE/jC4K2DJ80IXB31eqTF6ztZPgKXfmLieO7TtomXRR/tqyjeu4lGb528jCEgxlfh10CMn5bPOLFTE9qCrOrxgScO0c7TFEAcaquL+f7msmWx1hpipemID7jvz3sQwkEgE5Ra7gexqJ7bNDF9gsgdpSNBapMFzd7cMFQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784974; c=relaxed/simple;
	bh=jHSXjClGImaLnUASuR+8jTdYaDGN5yp4X04WFyLMPRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b0nF49Inx5WMM0cM5xxb3+QDz9Fn9XE91rIYNs/7nCgBDN5WXbGBGR4m5zsH+h5eLk25PUWgjwhIlL4Avaw1GW9JvmDTIDHAaN+Q5vIn1p3RRoXCIrNdubgJ78LktpQqg8Rg/jwq1sFbXAsnPr0xz6jzCA8RjlXT+wS7m18Zj6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lp3EDzfm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TAKSCLqZ; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lp3EDzfm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TAKSCLqZ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE0FIB2406281
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 16:16:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jHSXjClGImaLnUASuR+8jTdYaDGN5yp4X04WFyLMPRo=; b=Lp3EDzfmeHS8hX6t
	GNf6b1v3nhcN287t091qE6K9bjMVmKlepLB4LFKiT3yi6Og1majvzxOvHBh4uOtn
	tna3Y86n3MmjRD+fdqPQ3Xck1tpo2x6/9KCm9XzbZRo4KEz5bF9ux3ebPQhD1nE/
	iEIG2a1asVlBz6SpFz3qr+DVhxe5Q2pzRtas0HgwCVWt5wVXI20NfvvpsVik0rvE
	HDZTbF7UHahM2r3XQoLB6xFI10QdtgpslIbq76JB+uxXaOOWVmNH7V+PrigG6B0S
	Bjd4KQEuRTWcTuJnK29KdZcKilTa6UgEqHZYdWGdsKq1EQ9DMDFAtf0fEdOqPv1T
	PVmFlg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x1c2aep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 16:16:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cee1ec30f2so53099975ad.3
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 09:16:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790784968; cv=none;
        d=google.com; s=arc-20260327;
        b=XlLp8tb6qEfCKOcyYVPy1+++5u0W28JNqCZJlIwaVgIz9YDmvrjhQ80tMD05cRhKhQ
         GT2iPJfnz65l8kShyyxfeQq8YgxvI0vd5cVG4T65KG0z1D7Y09W166DvheQ9pMD2T7eO
         U36TU4BMVlNeWqPhQe1ag3gUvyJCz0SZdWWGkeDuluSwl9hlUSBWwloF5nLq755St/mP
         FBWMrmjsdGKXmJE9ZVSQjzJcqW46V6q+yW9sAnFsHkX2jSEnJJagybHZYX7LVTuQUBJS
         dtN5aBXJvU5mWgtv+aqkMG0VlK1KAFRFMpIBj3maWU+Hs93MC2+ZJR98R7lR3QDYgL37
         FmvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jHSXjClGImaLnUASuR+8jTdYaDGN5yp4X04WFyLMPRo=;
        fh=d9C/00EOXN4ZbB/fk9XCQs8KKL8PDFN0urYp4qj2PU8=;
        b=J1VnCfg9c+RIXBsiCdgUE7Oz+mCfHEaWht3QZVppoTFeXCK6h1aTuRYbR4YGcnGPCn
         tYg0Q+PMNIui347zRx0MN4aw1WjaGVGKSu3NzZcHt8QEABWa5Ff0NsfaThK5IDlzOXsJ
         lpP0zKNEvSgvgzt9nrBoHNsMNGJfo++G683nYBWwjgieR1F3CnP/GTQnjoYROAEJ0uMc
         FN+OrMaphIYvtTqL1ZSTo7bSowulOqHR6QyeZg5kfphQ9Sw27VsPDabF6U0butS7lSCn
         U1P2LlYLH6ICldyaZdeF2FdzKvXGW5OMeRfSTD90WEk0y7dJikMVC+T4eTJmekYKnB6U
         SzOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790784968; x=1791389768; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jHSXjClGImaLnUASuR+8jTdYaDGN5yp4X04WFyLMPRo=;
        b=TAKSCLqZCGhZ2dX6cz6mHL+6Q/tN7PfXGZSSxYy3Yp/wYRW6JIgILbBz+1PdvR254b
         zDjmcbV6LUBq8RdUv+ok+iuuOCun9HnA7Uj58ePl/8ajv+zwxdGOtbl9CQh+QDbBImiB
         94uSIkq5W9ojLwADCWcLO3BR2W2RLO5q4y3HXOGeH6zmZbhgyZ23mApYGUWGOrv6hza8
         j47mNpGuj/eWTCNGEQoLT4OCB+RwYabSPHLc4liFx4tvA/MeEZ8KcIhqm4s8GuCyHd1V
         zwjXy3wrELLMuGJRzuhmd2ev989zwjwj4ckkokSH5ExFLV/kSfJbMh/Vj0AHS2kAgqPe
         Fj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790784968; x=1791389768;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jHSXjClGImaLnUASuR+8jTdYaDGN5yp4X04WFyLMPRo=;
        b=WlyahxDPV//YRMaLa4WTAldS+q+Q8pfGudDWdP+h4IvtVuRzZ2EzvHDGoULtdTdd0g
         Etw6v5Hsbzn6FhudK88EIVJwtO8H9FZyOvfzRTPIKaoNFqfBrkdceEWuvVxQaj0oQACd
         wvEI/MXNzCfP6e4IInavUHPUZIKha+lFDYMUrVrdPOUiPopm/2kfjn5mLV+pys+M0UUe
         pKppsdGtCARRmToGLI3t5WJiS/4J5bHnhdLmSPSabNBKmclehEXZKfEU4ZI1+rH5M7xB
         3c36/KOO0OYTCrG18nnnz+WB+cR00Ojq+Wsm2MicLRFOjJ5FPLQlWdLcuUP1d6HMuTSi
         gmNw==
X-Forwarded-Encrypted: i=1; AKwUvBz09RpimoHKJEQompdA+ko+nKyIz9xnWj8ddPkaYbf7yB2ssCqMMSTlwRhXzoOM55+2hu3u3ZjYztcv@vger.kernel.org
X-Gm-Message-State: AFq9FYKF82bIYSG27RGoQ/i6mZlOSv4q6j2jXXRgiEi7+ECayXt3rfCG
	QBEPMI3y5q5dY94gv41naYGJRWHkoFstO1wQlY0+QJML/uiJbL+czyqMh9ygOwqbBrNaF6xp8Ee
	MjAH/4mij82OmekTarndYGqkigRldaqMJks7ON11NhUodz5pkqoQFKWCBl9HEwoYeuyVk39U3n7
	9lrZ0yozyJowp1mxt3qYQegew8JFkZ1+ssIed/M14=
X-Gm-Gg: AYBFou0bc86oQgvHKlCOWrheaXeOvafsqwn+eJyUbGmVHL8Q9fcv3ikYOuX+9IoiJVi
	42Dp4KmfWAOrEhqwrxOsP58XZaOXid3eRhGmlX3mBSEvsYX2KLuKjE/eTFW6vqHV3GRmYfa07sJ
	XOX5tgTzoT8En0y8IIztbcxxZ8+MEuL2SG0brpKAc4MQpqvwqXIHdJ7+CX2CB88ekealNSkHfrZ
	Hbk8kw2JxXspoWUsQ==
X-Received: by 2002:a17:903:2f90:b0:2dd:c100:4253 with SMTP id d9443c01a7336-2e2e4bba080mr12556135ad.55.1790784967944;
        Wed, 30 Sep 2026 09:16:07 -0700 (PDT)
X-Received: by 2002:a17:903:2f90:b0:2dd:c100:4253 with SMTP id
 d9443c01a7336-2e2e4bba080mr12555795ad.55.1790784967454; Wed, 30 Sep 2026
 09:16:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810152223.3946743-6-mayuresh.chitale@oss.qualcomm.com> <0710BFDE1F0C1A44+904c9e59-a255-4207-8f39-d465c6d7c273@linux.spacemit.com>
In-Reply-To: <0710BFDE1F0C1A44+904c9e59-a255-4207-8f39-d465c6d7c273@linux.spacemit.com>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 21:45:55 +0530
X-Gm-Features: AclHuK_5_kyqVL5WkfqdmvErnuGjAMAb_FhsM3KGsPnLyHRAuY03VjFVEgGyo2g
Message-ID: <CAHuiULCAAz=HUR6Wog8Avrpd_nikMme+dRgoMWCgZGYCkx31Wg@mail.gmail.com>
Subject: Re: [PATCH v5 05/14] gtrace: Add functions to start/stop tracing on a
 component path
To: Zane Leung <liangzhen@linux.spacemit.com>
Cc: adrian.hunter@intel.com, alex@ghiti.fr, alexander.shishkin@linux.intel.com,
        andrew.jones@oss.qualcomm.com, anup.patel@oss.qualcomm.com,
        anup@brainfault.org, atish.patra@linux.dev, conor+dt@kernel.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
        irogers@google.com, jolsa@kernel.org, krzk+dt@kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        mark.rutland@arm.com, mchitale@gmail.com, mingo@redhat.com,
        namhyung@kernel.org, palmer@dabbelt.com, peterz@infradead.org,
        pjw@kernel.org, robh@kernel.org, sunilvl@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfXyzGBxr4GZzED
 VskunL0lyB2YrKEFcx5hSq0EFttsbIZJk7eShzMfHq058ExzpVS/lwuRTktTSJicWU6wmQiS73y
 HfH71KF991kFbnDa2AGPo2XwaAgIzhE=
X-Proofpoint-ORIG-GUID: tzZKReaMeBM-HRQt0T-x_TGvIzMSoudx
X-Authority-Analysis: v=2.4 cv=VrC2kO2n c=1 sm=1 tr=0 ts=6abd35c8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=lv0vYI88AAAA:8 a=510OZKsArkfa_Uw3Rd8A:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-GUID: tzZKReaMeBM-HRQt0T-x_TGvIzMSoudx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX4mm6MUAR3N4D
 nj/lEq70GoLF/TAMAkF7fFGAUYilUQpv30K5uWT3kJTSaB3rVcO3SZGGxYcSueHiHj1tWoOBCE0
 V57scfVlh3zusWBkRnpXKsyrHkfv6TJUxpBOo4b62xiQ6ujXVjDUwkLIjbp/W1L9R2tYh+LzNrM
 xUkxrio8O7pWsIIbS8qbw3hhgrfNdyLvW+MRCBbMVtA1T3E+UszIFgIheGYtt9iBQrcOW5srYY2
 bO/166vtnBqJCsHLGlLCxg/dy/QiLrLmwpPkQC4zrKAeAvSdgG+NLklfH0iaO0VfTl43ofug9d9
 ygwgu7QYrtWCMQBsyNDZkFI4lYprGiAmlYYizPp7MfmjORNlWzYl3ISijaUCrNqVqhEYcRuIHSc
 fBT9VNZczZ+zD1lYQOAupkvY6xWKX6bOGK63G9LNfMXdKc1ExJL1gt3nRHT6T73NYJ2FnfYAdi6
 RahgEhHW4pb8vCfjxMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300064

Hi Zane,

On Thu, Sep 10, 2026 at 2:47=E2=80=AFPM Zane Leung <liangzhen@linux.spacemi=
t.com> wrote:
>
> Hi,
>
> It seems that the scenario where multiple paths currently using the same =
component
>
> has not been taken into account here.
>
This will be addressed in v6.
> Regards,
>
> Zane
>
>
