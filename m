Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7540652CCE7
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 13:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071449; cv=none; b=pC8Tth87FjSEptwXhgimSSQCzot3j027ILLzlEuD8Mojrmiq/rH/ucHMiC+zuu2SWTaVOEXZPa7NrTvtnJX8dc08Zolh3lFPrxU7QOm/UXzaXb2epgIapO5OpqyMTkkBML6sfUh99PGQWPUfGIQAjXHWmNvo50wStFS0cipGNu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071449; c=relaxed/simple;
	bh=Rr8tKvuLIbHer4z70c1PEIP+GhIwwJ53fCRNir/Hv0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pd6XhAiSAhEffFbLs0+GssOmSBmHSYKJhKCx/sHv5dnJuFG/5IV8LqF34Ese0JEhwl7YXmMZka+SrXEBNVA7igYdEkEWL+rryu7KCqBVx1aNQGyufeJfT7khFLq9k/pJsq073c/vKWllhUNGpX/34YlDqVXdZSb7JcFa9OnvIOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WivuusCk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AmkfxicV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WivuusCk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AmkfxicV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FDYN9G3462710
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 13:37:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1F9zr9fE7um7OOUusnwc2n/ZgW8xRCM1buc2Uy4QR4o=; b=WivuusCk+hlbU85X
	hIv4ny64H3GiGygQ6IbVc0q/aBFvvqdSUwFVsAQR/nvNbetO++jmLBhlIZp7AK/x
	oqDSzjZd7vAtT4LBw6PJfbr9JarGoQkDcxaAlFqyXROOxKsVz2O4E/KANd9zT3B7
	Cg26D1NWl3VfUtPsKPhV67sq7zAcftR4/tjPerzM2G+yXMQd/WCQ8NMo0DLeVsKc
	jRKCftEk9y+/+1MOFwtRBZgjzAsQeCu3rh0a9fSSwQns9ovsJTE1Igo1FsLpo6fE
	SfmPxancjTTaJaZI6vSOW324RWAJ0dqL7RLoEAYz/+i4XJ6rKfJrnRJTEr2o9gL0
	Z1Xa+A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hayu680gq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 13:37:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e629c7b16so85385185a.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 06:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792071447; x=1792676247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1F9zr9fE7um7OOUusnwc2n/ZgW8xRCM1buc2Uy4QR4o=;
        b=AmkfxicVr9JgztxiLuKBMrJp0c79KZtDTTKqX9Hdgxs5v6Bc4h3KiB1DOcroY5rhmz
         9hN6pZlrMOuxj49Vn2Bu0n2wudELSn9JUfyRLyCfe4xbmUTWaA1E5V8ChuqsC5bfHZIS
         yZG+wGRImnrOJVjEGe3ZXd9blkr2Zkq2iptvKk1+WhKNTouZmxf0ikZhglheftV6PWKD
         diwp7h+lytm9GAq/2bLHL6m5wzncEPQOQliLflinqy/+QGTLXqHcVmxOILneaCxXBdNP
         W9OVQMBSZKNcBPgAt6QwfV5KA/cgBCJGMmj5unOnOIHwG0coQjaO0AR9fhonPSGLXS0J
         otLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071447; x=1792676247;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1F9zr9fE7um7OOUusnwc2n/ZgW8xRCM1buc2Uy4QR4o=;
        b=uJ0yL92V/SA3nrkkIkQ1v/9WJVehYCA9V0P3kYFbNbDa2XgsFOhUVIhdDZffQkU/mr
         CcBOtMhVZpi7C/aSuXQOGQOOGh0w6Xz2mTyS3yVH8WbNPKNbnkmxytm3Mo496+7QkS8P
         h2D8IP40GfRB10RAO4k0+J7c0a4/X/k1g1AE/4ngM5CDnLDmwNsWXOa16OhHGwKEUF3z
         n6RcxEnPVBQ+cryzu6+ApiUYyKYAKk3nyaxFHNJKxxRb/7RymJ61kicog6sjJEsH9jh0
         pb/AKhaw9AeOPdOwDM7NBtBVCEUMXOXIhKm4bNr+rckBC8fX3zPpJPcP77AnlRPELgy+
         4ONQ==
X-Forwarded-Encrypted: i=1; AKwUvByXN0e9ROhvGONbIxadnFDQJChqbL/n+wHb3F6+JhOYGJIAz1uiKGBm5/mWKeJhQhojoipWJfK7LN95@vger.kernel.org
X-Gm-Message-State: AFq9FYIdXodKJviJUrwSziPzZfzqo2NXi2SdjnuXAquvLnugNAaYxAVA
	erPSXP30cfRLu6RGSCCRrUPsg5cjW6mxAF78SFiNjXbdam7qk8DeHaBq4WoDB6scj/1RL1jtpb3
	Lo33z7m0fFWK7eGXXyVWCgLPodriagK++L0ZDEf0sbIjq5d9sHeIa1LQL5Zj3VRT0
X-Gm-Gg: AYBFou3VR41Zqn9m667keQNMY/0oAWQKHPGdTgqATIpm075BuhrT/GXjCrgc1d4o4WF
	wPtuST0q3N9nEW/lsLRaK77achWZuO5mk3WzFrUMqt6kK1WM0nYdAWx+F+4faYmHfE/VHMXU4g2
	NJXVtdmhoFqYBGYqMQ4c+0+SoIjgctr6xJDtd26A92K8miyjpgvLYIsK0pZEjOQltowTcp3cdfd
	WAfUKbIeN7PQCPE+S9MSKPV3/EpX8xfnE34jx8OOCPtfgBtZPWRnQUkB73l25ZHVxMrW+dDuWJI
	CdkpV7Bjnb2ISPe4QedVeeR6oBg7Jm3PDwbuZfpI5ViKGCXiVYz1p+b9Hj3TmrASlRJFLXx+x+L
	F5yxTguCqyJuf/uZw5zhe9w==
X-Received: by 2002:a05:620a:29d4:b0:93f:977:5d9 with SMTP id af79cd13be357-93f097721f3mr737092385a.0.1792071446736;
        Thu, 15 Oct 2026 06:37:26 -0700 (PDT)
X-Received: by 2002:a05:620a:29d4:b0:93f:977:5d9 with SMTP id af79cd13be357-93f097721f3mr737086285a.0.1792071446150;
        Thu, 15 Oct 2026 06:37:26 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed9b3db62sm124877266b.36.2026.10.15.06.37.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 06:37:24 -0700 (PDT)
Message-ID: <1be895b5-7f31-4075-9f5e-a6f4e911e363@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:37:22 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8350: Add CPU dynamic power
 coefficients
To: me@fromdisposition.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-sm8350-cpu-capacity-v2-0-67ce449becf0@fromdisposition.org>
 <20261012-sm8350-cpu-capacity-v2-2-67ce449becf0@fromdisposition.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-sm8350-cpu-capacity-v2-2-67ce449becf0@fromdisposition.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DyNYRtyP8JFLk_5ZY9W4kKuN68Tkl0q_
X-Authority-Analysis: v=2.4 cv=ff04WEQF c=1 sm=1 tr=0 ts=6ad0d717 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Tt5JBQAfAAAA:8 a=EUspDBNiAAAA:8 a=8gZnDd_Kn2CknuJoWdsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=kpHMOrJS8sLNr5ru0mYA:22
X-Proofpoint-GUID: DyNYRtyP8JFLk_5ZY9W4kKuN68Tkl0q_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MyBTYWx0ZWRfX1uYUJ/DktNjM
 nPgON6n/8kLWWDzzBCp8xJZClZqxamAenXjU+tg4x4HX7w8lOkzU8lKPNNzOrGiaGHAOwhQgyfb
 lAwFYwiOEhWOXdy3Smv3ODYc0ETerF8QBRW7WJhL+uISn+kFXAt69Z5AqSjiPARDqKygZmDEP5P
 TJdEvxuYX/T5TSp470lJuqpfCMw2Knmyr1iNnlKVo4pU3NbF8+4OTa6orYPZ9JUsZ/axI9ouluS
 3FA00fnAlN4b7juZtYVk1lQrsZ47CSZAl6XySY60qfhQcFEP4qHiyHWGQ2AFhBKoTJX8aEI5GFZ
 ZMQerU4MkxXzlbJLyjE/2ZjDTM8uH4PBiNYpBgJ9FTVuCvY/S2bt0QayFTTsdRQCHiwFI/aYwPM
 8/TLNbQAXWhgMOItDrIVJ4+2epvtwOo5wPLKcQFXgt6lpIITB9ZVkrwZPFKTbPjmMyUJqL2BGaP
 XnwNUb8ONQEE0NkTR4Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MyBTYWx0ZWRfX/mgpEGnsaKOs
 XVwCsMuFelhRfCOh32CXdQpYQpGm/RCMT01hVUZZFVyHEGzMlrbhkS+smbS3/2bOoL65oBgjKy/
 JRI1PkztI5T/I0/H/KBClv7XlpXEugs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150053

On 10/12/26 5:56 AM, Demeter Barna via B4 Relay wrote:
> From: Demeter Barna <me@fromdisposition.org>
> 
> Without dynamic-power-coefficient no energy model is registered for
> these CPUs, so energy aware scheduling stays off.
> 
> Take the values from Qualcomm's downstream overlay for v2 silicon
> (lahaina-v2.dtsi in msm-5.4): 100, 499 and 760 for the A55, A78 and X1.
> For the A78 and the X1 it replaces the 515 and 845 of lahaina.dtsi.

I assume this mentions the diff vs the v1 chip. I find that a little
confusing to put in the commit message. FWIW if a v2 exists, v1 is
almost always internal-only and not of interest for upstream

in any case:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
