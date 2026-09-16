Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FBE3D75C9
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 05:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789537846; cv=none; b=AXtA/yes9RZMG675X9dgkTSvpqXRMyZ3XKBSgtiGPuYsotOV1TZ6ER/LPz2df1SLzM+E/r3QoHTuJF9gK+ROa3TIAPfKWZK/rgKBhvuc4EWyAziEggQ21vra5BJl0W5rIKUNQBGwZG1Lch8ikwqSXYL9Cqx1ksrk9y8YSEkpB1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789537846; c=relaxed/simple;
	bh=yqtaqs/QTUH+71laAr8G4WYL0VzqMfc+u6bwft6kSlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C3i0IrvdgyAcVpT+5rcv/TaaomySUnL0gkWvWaF0PbHWCvQeay5kezzXGkkz4QgwF8QApBb4yvARMhDaaCV3m5btoP8ipSOMT70JW3YPf4KEuNmh8NCpxnlNxYVDC2Et9mP279cp3HiDHr/Sty+94FIthB5Fu2JgFui4n6w5Ea4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UEonUxes; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VBPCJsUz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UEonUxes";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VBPCJsUz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G5lAwl1932237
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 05:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yqtaqs/QTUH+71laAr8G4WYL0VzqMfc+u6bwft6kSlE=; b=UEonUxesB0RJMWtd
	Rx1h9y+CedLxPMNi3enkDlPUCpLW7gWf1TMbzfmReJg088PvYS7sRotEP/CN6lZI
	ExWHxpgH+8NJWW2aQK92AwogLfb3b5pziILH+hYvb79+NUBajZsc0JOyv2LgDsWK
	oJOlmPXXljov7DY/NuXvEznp5mSVe/a/vQnwcAZktAMaEEuD8tNAcrpJJ8yb3Pn4
	hir+Z69dKyCmqU7WGP9ArjUEZouJ/NJ4yCh2s1YN4Syafm9bgnkgtZlO8Gt8DRst
	Z0EQ548JyjtBeiKgSMzMhNc1mNkk394V3Pi+P5TiSbFDIFT6RL1Y78FMKhJ3iEG6
	VvUNaQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqefp9g0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 05:50:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93918756165so1009280585a.0
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 22:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789537843; x=1790142643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yqtaqs/QTUH+71laAr8G4WYL0VzqMfc+u6bwft6kSlE=;
        b=VBPCJsUzlXG/UFrQR6odUO0UqwAr51dCE8piDZA57VdtOkoLerd0P/3PA9T+BdWQka
         lj6uncImaMjIV5H5W247Gx1/G0edCcpDQzE+DSOZemwhqbrElQHYb3GMpoxagc1rV+jf
         3VOvC8T9V1E49qAanhrzczcN8m4fQhaKRWpVSiE8AqYjbC3+iuKkrI8CihwSl3OB6j7M
         5euy93rU9dSq1noHw6XnulpIbqt/No3KyIGd0/ympdH343bTHEBTD3Hl17/DHcbcCaQt
         39vOv+MLnwOXVsE2nkwlsgLUmn+bXfmJTh+hZcO+qDtU7PbjItSHy+c0a2m1B+vWP4yO
         2S+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789537843; x=1790142643;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yqtaqs/QTUH+71laAr8G4WYL0VzqMfc+u6bwft6kSlE=;
        b=H9QsT1bvBg3QPG/EAaw50sivcWve3tQIQFdDMpruccN5O+MkiE2dJ30UX9fzkJoSFt
         8qqHnW5q1qU+/J6V2UW1fZ1KzMHyNWBQmsWKrXmfmgAFi8A8xe4A/P5CL6/Mdwtppuib
         QoirTCBB2zMc1PZXgZbALyuoUUsOcLMG6M+ItxKlsA0pFc74EX8HGIkrM5fhB02qMLrN
         TTHUUcI16mj3w3WvYTKY1TqRQ10+c3fu+Vl3HC1biLCOZ1zUOmq9dz3u71X1jo6KWmSI
         qRQLe9ncaQsL6uQkSeP+sN+jaAWamUKOTBA+LyMTKWesP2u3RWxIV1Dta+9aRrPHijnF
         p/Pg==
X-Forwarded-Encrypted: i=1; AKwUvBxZ7TIPTyIyYGkS1qyzN7C9CpMx3hlb71FWqTkdB0FKwVdh0sQnna5uYxEDxfOSsMdIWDeMSFmjCPug@vger.kernel.org
X-Gm-Message-State: AFuF++k0CGBfAGWdriG84SPTlAe0buz8C8xqpi8883cEq+MaLUbddks8
	LoqpU10N1PD1Puc7F8Gq1bW+gFT6fyJnLyOc3WbEneRzjA1dbq/LaFEZ048VZLqr1tuWThlMfFY
	j6gyRW1gOIbRH1qLgwjCnxXD1yvZNvk9a/rsrD6w1qIGSqo8mGpVNXQnKu3ZrSJPS
X-Gm-Gg: AYBFou3N1E8UxAT+kaszBWhBtLXbfOwbe4mVNO4HfaqIPHurJgLgMIqGb7MOHMRLFze
	ioBB3g5cW7j3+Qa66RgpjGG5kCYv3oFK/4+V3sdJS0Cd3QI5fjkUamvtwrmP8/wTxruw29a4ESj
	MjmzbFnJAalrVEwqJYkKJvO6uqZxxUw7alnCEEN8697NGVyPNf4YIjoYH9nKtznpgd5I8zSpC+p
	q1D1fNZHupd0unqVgWFjv7d/1Ulr7aiErcErmU5qDb8acpWMXt8zz8hROlaab3G35BBP3VHnnWD
	++pzg36MvEsXtMvAVl0+yALkqftq7y2xviLiMYyuaN2dkbAGWH+X60z7eWi6ElJR0PT/FnRW8d7
	oj4E05D8lf3rZ936icx6jXFHwcyoV
X-Received: by 2002:a05:620a:390b:b0:939:9eb4:888a with SMTP id af79cd13be357-93bb76a62dbmr175220985a.1.1789537843054;
        Tue, 15 Sep 2026 22:50:43 -0700 (PDT)
X-Received: by 2002:a05:620a:390b:b0:939:9eb4:888a with SMTP id af79cd13be357-93bb76a62dbmr175219285a.1.1789537842682;
        Tue, 15 Sep 2026 22:50:42 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf4161fsm4317243f8f.34.2026.09.15.22.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 22:50:41 -0700 (PDT)
Message-ID: <84ab621c-61d2-4da6-884b-05118e093d88@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 07:50:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] dtc: dt-check-style: Relax property ordering rules
 (drop alphabetical)
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260915-b4-dts-style-checker-continued-lines-v4-0-5b8e09b11ef2@oss.qualcomm.com>
 <20260915-b4-dts-style-checker-continued-lines-v4-7-5b8e09b11ef2@oss.qualcomm.com>
 <20260915173834.29EF31F000FF@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260915173834.29EF31F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA3MyBTYWx0ZWRfX36n/D3GkulK+
 0V2AOC+g97tNQhH/kIlYtUP8bs29Aro8P1UQ08cCTo4inUSH00EX1W75GoEqjyS0NHFW6SDoOKh
 40ReSxaoCkwaHBXomdo9LFoZ3zLEMts=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6aaa2e33 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=9ZkQsALANqwWZhioCQMA:9 a=QEXdDO2ut3YA:10 a=arBHhYMabMMA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: rHqeIxRPR7Qe88o_DNmeYw0ygJacz2Oc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA3MyBTYWx0ZWRfX+bkc8/r5k7Zd
 sRUDcvbnm54j0zt4jAcEcatKpcfisj4OqxULP/4gmnDWST7gNlhfQOFMkJANu4+mVxSC8ZwSzYN
 1SpL/h1sNKddd/Hy28mWUPILOhSwsyu7u9SAkCTqLv1aLTHWZ53xIHZKReTk3W2U6ShiU2uYXhP
 LGvanb8pyZSfK9kaq/AatWNBTxN1bbRif66efz/ir1TkvA37FQEubqE9Ha2JkXye30hzoAjhMIH
 Mlcdz/YUGmXV4zp6u/Kd7MmaMOuQK3G6vvGPxGxh8vF3EtuQpakRSI8LEa1+tnXISNdhkyfSbBJ
 JMgd5J7GoOPd0FOaRblD4+FzotGXVIOypa5sM72pdyY593lPdStgAhHZ5wkQD92E868fX41r/+j
 iUcuDFu+GTK/d3HEvCZyB4MoJr2j2TpoeOEUXv1M9OkjJUYrEjHij37kVT3LBJJBNcgyyqAGm+o
 vrrZjLwQu7vtwxCwCXg==
X-Proofpoint-GUID: rHqeIxRPR7Qe88o_DNmeYw0ygJacz2Oc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160073

On 15/09/2026 19:38, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] scripts/dtc: missing pairing rule for #size-cells in dt-check-style

Not yet implemented.

Best regards,
Krzysztof
