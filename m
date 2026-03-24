Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779E0359A8E
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 20:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774385752; cv=none; b=PSR/wM3qES4TXYbccxxjqYrsVWPlDqGm9sn+C7JzYNwyt6ugHo9hu/Qw/Vd2fAZOio/tg77S1quaLaHSfcdBayHqYcNsp6Fz8ZlnV6ok8DEjtdjyhh69fW3yBnLCfUmNQD4Z9Its26dcHYwWC+ulXTUyrBTk+w3ImLWzjW/r2Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774385752; c=relaxed/simple;
	bh=Tip31mtpSyG902kHENlZpUBHz44WRarDwG5LFNLqsa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AdbR9nlasfo0DCzBQ/tuPZA1vgWf2e11kM1rp8yxk/Ib48Ynyi9x7yoPHb+o+i9mAIFy6wADDw9osZyCmDDLEYiH9PMDqR+eEzV9EQH2/5xIpghMH2Q7RvFz5n0is/79iVctQSC8FME2BTH+eLUfKAoQrKswX8sCL8olA1tf6e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aXOSmP3B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WbS2J+c/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aXOSmP3B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WbS2J+c/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJD9Rt2146783
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 20:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Hbtb0UBOQpzjCA2lgujpOQeN
	giW6uz2MkjiqB/qBQTI=; b=aXOSmP3BXGYuPXaBnQZarMxzr/EePddfClDumran
	keoEzSf/xCm9rcUkGxdOF5dW4es4dvYzZjoNOUv6O6s3CjohnUJCv1MvUSuVBeLS
	29JWZroXq2rItavr8KfvRV6RVD9MkqyL6Gr4LSx9G1JoXnXnVdc9FbEVuc4cvpQK
	GSuXEnXewWDG1KhrkdKoLaO1Wd4pceSYOxodkPymXJmX+GYVUeGSy49KUtiMwwHI
	hFUnUiwe0jueAeM8w8BSugusHSbQW+IQNwCNH738g7oEuPjn0pINuZ8J19nZfrKB
	09J//R4ZIzxqUawjJ7P4cJnKsV5dy+U8cTOpXa01Ju8gow==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3nexu9nx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 20:55:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509044f54aaso98713821cf.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 13:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774385750; x=1774990550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hbtb0UBOQpzjCA2lgujpOQeNgiW6uz2MkjiqB/qBQTI=;
        b=WbS2J+c/2Nx1jvJ7viy9v8Qab6r0ZOF7dBuMoE+qdX4Wn9EwBJ1rBMQ0JeCUs6t1PQ
         PyruRm1owvPKk9i8KNX2NYt4pklNjQz56ej7E/2hQJBbr/FENEvt16GEj+v39e+crN/5
         3LRiX7gNHNjKrxVHrOTrgrDz3C7gAlw+ok+wJwE+fXzQYiYvYSME4K9av54mq8vRhv/d
         ELc1UUPgJOVviA9RPijiM5EXpiv3xTn2BpYRjQLTTMX1yoykqmhPytrcu4d4e4Ts5PDJ
         yogIK8RyQOfkHY4NdThYJkegy6+sRy4LZeRoVkkS13nIrT1U6iPubQEWpKWfakmrl+TX
         dixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774385750; x=1774990550;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hbtb0UBOQpzjCA2lgujpOQeNgiW6uz2MkjiqB/qBQTI=;
        b=Al0+WDNM4cbEREcX9Dc9EYtqvPVwMpPRPz4/dx6NSzvHrP4ZJCY+bLEIR734oJvNpb
         7qgT7pgl6BCMEk37RZXBqitIAH2H0vd4HTT4bazKd9mIrPCIFSCD5aQsSsKwrVmiKf79
         Av/zCFK99+LwT63AruPdEOFZP2zjQtp7PYCZ4Zc5d9Kcd4PJ+VBugwCuL/Pdb+ePW9cE
         FnVutd6qRTNbXFdD+LUODuKTB/FGZWw3iEbDoColTWNN95J4FH/u1JEloacBaN+y/YzH
         EHsYbCMFFOKROFdvkgaPRoRA1SFszvQI3OokYAkd0oQV6yZ/r4/yuDEgMwrrfhSxG0rw
         u3BQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRsNK62bb8U8w5YnBr1zDzWNFUWFcJ+cBwgv6D9RMacTacx8zYbcKXJu6zlp8V4kHFGxldU0rX2Trb@vger.kernel.org
X-Gm-Message-State: AOJu0YzgDNxpba3kyMONLxEIwq9nvfKoyaQhdShIKwE4cWTQmzKDQJYS
	0xqx5U0ZaEk3ik7atK9cBrYec9omtDRVWsd8rUJGUcjisLAY2gvy+s4bW7lE7IccQ6LXvol5tAX
	9a4HehAfv6ZjH+KBqWxpmMWphze2TIHwY0O9HakmS4xmv93SPtijqmkY8aDrI3fB8
X-Gm-Gg: ATEYQzzYl+oJDarjbfij+f/TtV7aG55AFeXUOxXxa19pmf9rtfQhf42/Zv9SfFdLvQ0
	mxQYK9si3V3u7PB+OCJitdY8Ur6EKiQXUvGIR4+YGfRpHYQtcIQAkISQhJlhjL/RipQ5+3TZvFq
	z6t3KAaRU+iwngZCZ0DLrmO64Yc/Bb4uVVyOmQLT+x0bHFctV8a9BxUQE5Y4bFGTrAMfHac/wsQ
	6zC06TLNqrgfdsShFQu+ra0uAH7Cbn2cKAQxJfRo5PZ3rM2XJS1uvhq8SmAowkyUp7g26QAynBu
	TWsd1FvTV3ShWrP8tEvNQBfid0FMb/7h9Zx8SoF8tnP8kmQXJjZTmx2WXGp7tgzCEQt+SS5quxk
	0mO8FpAZFU/6Ax1Fo7rICH5d/nS4UFGfP1koxK9WE4fifu/EOXTjjShiykyssFEgPWiJGsgoIzA
	uFkS5VrQN3H2TjoGB3lB7zjgmZxlNqXHJueJg=
X-Received: by 2002:a05:622a:1108:b0:50b:3ecd:ed29 with SMTP id d75a77b69052e-50b80e4b391mr16993871cf.34.1774385749799;
        Tue, 24 Mar 2026 13:55:49 -0700 (PDT)
X-Received: by 2002:a05:622a:1108:b0:50b:3ecd:ed29 with SMTP id d75a77b69052e-50b80e4b391mr16993271cf.34.1774385749275;
        Tue, 24 Mar 2026 13:55:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2851ae39dsm3380929e87.36.2026.03.24.13.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 13:55:46 -0700 (PDT)
Date: Tue, 24 Mar 2026 22:55:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v6 09/15] arm64: dts: qcom: sdm845-lg-judyln: Add
 firmware nodes, change path
Message-ID: <vjf4lqbd5igkhvonxed3tkydxkcc5rmt2hsefng4oojrpzf3fc@a5hujilezcdy>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
 <20260323-judyln-dts-v6-9-29d70ca1651c@postmarketos.org>
 <e32a0a50-9c15-4f3e-8c83-1f96e5aae4b0@oss.qualcomm.com>
 <e833f72236342a7efbce04c2109bf921f770673c@postmarketos.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e833f72236342a7efbce04c2109bf921f770673c@postmarketos.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2MiBTYWx0ZWRfX8GRX6SNNTCMI
 mnRTQ7Uge1JEJI0v2nOFr7kMozcL6w1IAqS3MnL1TZbnRqQVnlzFsr/cqFS6zmbSG2SWDPeqD5T
 01QSSTrN36JhImXwVAZgyt/lsBnysoR1J3gM4LQDA3TGRwVUYROtBKR7njTx9VuDcaEFcd82Jyu
 uH/jkMoNFeXQNJzdH4DrAqQ+KvHmqCv5FyDd8QLiYyS1Dn8r5Gk/3DmOxCcIm5DBozQnpObUaK6
 Daefpp7TQigisMtIQDBkf5miHXanPDWi4MUUedI3hHm/UwxlihIJmANZtkJ217OW969HVWQgL1f
 6vXwTmRmLlveKGbdXSA1vdrZ4Zeu3mL+3aoguK4rh4yS/8a3hV+mtbC0By92jxDnEeB7Nrd6uFy
 rhDLdZvBL5XYdqX12VXlFmUEJMb/OP1JiSTM8xkjVQshE7KnMc4EwYAyhIdflks1GQotLx4j7JI
 HNQwl6XF4mhuZpIwAxA==
X-Proofpoint-GUID: e74flMeOFS7WTaJLLLIhKcUkbU5RUWs-
X-Proofpoint-ORIG-GUID: e74flMeOFS7WTaJLLLIhKcUkbU5RUWs-
X-Authority-Analysis: v=2.4 cv=Bd/VE7t2 c=1 sm=1 tr=0 ts=69c2fa56 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=XKEg-W0rSRFBAHshmuIA:9 a=lqcHg5cX4UMA:10 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240162

On Tue, Mar 24, 2026 at 04:17:09PM +0000, Paul Sajna wrote:
> March 24, 2026 at 10:49 AM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com mailto:konrad.dybcio@oss.qualcomm.com?to=%22Konrad%20Dybcio%22%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:
> > What about the other board (judyp)?
> > 
> > Konrad
> >
> 
> I don't have it.

You don't need it to define firmware paths.


-- 
With best wishes
Dmitry
