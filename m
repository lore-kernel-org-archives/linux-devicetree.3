Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013694;
	b=rBTU7YH5OHoSJBcxVPIFTZrj8KsGxDo98gVmolmJWKD6Q6Btf11dxqujEKukL0LTQ+Zo
	 l1BqnG+4B1di8ZLP+xvJDhPmjBZXO97TGb/ZbIyqGgN4NT9GpJ4w73AkqtBRG3nCAALEY
	 SGReeUCw+DaS9WTl0lZQK0KCeVJ0AuKETuIKvHm0kqWwOLupvVyaLZut77SXQcGuyzKKE
	 mpsK2rN3lZuP5/1L2eAvz7PlnrEg2eu2ccOIlZ9guADer0aixc0DCZAYD3U2o7BhGQcvD
	 hZJlK9X16/VwZy1eqguTz1QJMDiFyosdu6XIlEgvgNaUpIxkk7y+gyLZ9xkUE7ApVgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013694;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XqszqiOkBMdk1vvS7oxfstl8dAzvdx7vbMieJ9TUstw=;
	b=skKx9YaSfgn+qyfD+1Q/5ImKe0TP6EfuujzWUErmaOPB0wgvuJCVVGiZiGKdv96IMbGf
	 qy3EdCJyFSaflUkhREAgZhqEmomyr1pA5PSnrlVazsnjSEMavNDtBPY65+8Kk2MIW0IxS
	 Fx87UT6onaYsK3mIS9VnF4UhnCQNeeVyLbXYH+G/DUhYh/QcHaWmTRcs0kuJ0p4LAK574
	 40e1Ey6zv0OKSkH/j0FyJh3s24warzyBcVw2rRbm1tonyVXAE3lvO64zUrzfWzwp2u6J+
	 8/6BqF61vtDBOG+BVlqtFSPbZfs/dD2fe8pZ6GrZ7pVjPTID49DoGkeIhOivQxamTyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jbim5pNr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IO4KcZ2k;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658A5606A332
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 01:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 658A5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jbim5pNr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IO4KcZ2k
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Mo5YC3696090
	for <devicetree@vger.kernel.org>; Sat, 7 Nov 2026 01:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XqszqiOkBMd
	k1vvS7oxfstl8dAzvdx7vbMieJ9TUstw=; b=Jbim5pNrPgMo+g46DRYZjAFuvhE
	Vr6G6u9Xl5bnz6g9WcIHzXufPefgfrpxGPN6+vQM5xK68i+VNDmTKdw9HS/3HT7E
	sLN064N8UnOJczaLEC9w8LKnUZH7XnNcPLBssD6EHqSoMAdVsR2TxiI4MSg+JkjY
	mE1v9RWM3WcNptQ7Uy7bBp7qLwVyekdd4qyZABfxq0rLy/iUKhM5MmsPVUGYg0um
	WTs1NCVnhnZX5QmM8/Mlq/Asxv7XhAr1SRQXkGoIvsvFcm7B5KNBOSVViIWaGRiV
	hyYdf57huav//qkoyn6x0MitT+TbwufIsIdrYAHV0GNppL8ldGIUf3SQ94g==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmyqryj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 07 Nov 2026 01:08:13 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67906c453b8so332327d50.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 17:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794013693; x=1794618493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XqszqiOkBMdk1vvS7oxfstl8dAzvdx7vbMieJ9TUstw=;
        b=IO4KcZ2kcUkQLr+wGtUcH7RcYMVk7RcG5c4JBi98/ZUS1w1aGT0uM1CtiE3kqht4uL
         QsOEccoSC8Xk1zR1bw7ZidpTUufOAWaiQW0YKS2d10VMbzGXwtxVhbzPHGxI20p2STZB
         TbAffWYgWNntwfzvI4inq8P8hhT/R1UcBYF8IqNA7vq31PuAar/rLxI5MMZV9+ThLAcT
         HDFzduuqPQjAmzRVrV52JPsnY/PhE9bEu5ci3ikn71b1YbWT4/dusTPyDkYgvF+S4DU6
         rfEmxwcpCoOF+AdmWHnFLzP+akAd10zs1QQnQ6wGumbYnqqB7VLsm6khbBJyF9XJxT9y
         jAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013693; x=1794618493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XqszqiOkBMdk1vvS7oxfstl8dAzvdx7vbMieJ9TUstw=;
        b=2FE7T9vPOAbQQ000LvyfmT50NO7cgU2iqnb6+81Y6N5OaM0Bs3vevdc6XYGnyPTV8I
         E4MJyknZoUT0MxWxB4ZYOpnEnLy7wLn3M1PsEHin8GQF0Bwa9urb//ycOR5RJ1Dt+HVT
         7iE5O2XOAaUoX0xmzmgVqMp3KeqPnGILWHMTVGKr0y6FyCuZjttdD3DgbU67K0voVLbF
         9kb463wCYuvZ3R1u4ij6xjwxFDGY1U8qVX2mx2YJ2xgt3FOThM1ogwUpfSV+V1W2NSIN
         wWJtL9l280x2tjZNWe6+QvfleHc9PuiQi3uiYjx7Tny6kVjb80OvHhlFGcXSS5uWlJDv
         VUHw==
X-Forwarded-Encrypted: i=1; AL+hErHXqqNFqm5Ko0INyHchqyCzUbcvWS3KVy3WKWuz5HMRZCC7iRXJ7auH7498iNA4b87klaOxL+GeR7m8@vger.kernel.org
X-Gm-Message-State: APuU4Z9oT9RzpujiKaXJCJdCi1Ge7T9HgdoKnJ2gyXjixF3zlBGBsLdS
	fK6f5d3UFQRq/R9xsA7dzSC+gGddP0dST/vM5rFdnq119PK7/RjN9zstRGCiu37gxi9P+4rH3rq
	aMuDhrnRY3rWg+8bkPKpNVfwhWVpx7APmrROjdfTQuvBSplMSbAjhntLb8FvCjGie
X-Gm-Gg: AYBFou1zMsdKnGd+G4EiTAITL/j4Mj8CsvhE8Pxceq5zUurBbf74L4ksEgZIf5uaFvx
	2dcKeJ9rT3ztIGxpR3ESxH3+AYsp84hMdNTewx0I0ixrG/fjVXtRHbGbT/ZABjW8KTja16oUAp/
	gJXJjuykjVHAdJdid5bxhiEUqXFnbS29iclrdq+CfkD8dPmN2vm+0+0AZxn7bQlqDxJPe4pXw7A
	jryIFCDTgBPcMi0T0si+s4p8rf0uz+D+F6eGgXvihmQABv6m56SI+9djRytE/yjsm6jmYSRpq1f
	NaIdZ37rq7vh34TcVJ4LNFdJ9Zma/VMonrnococ71S3e4nWEV1jsh38XcdLywMex2dHfK8Av9K2
	vrli70AVEZN7Ld1tX2Cua0UvKhDffsOv3MvjMK3HvQ6NNMGBUfExfXwh0Ij6F7fX2dmVE6RXI2D
	cw3i103GQgC3yqwqVk4hSknYBdO0P7Sh6OFg==
X-Received: by 2002:a05:690e:438c:b0:67c:f8c:22ff with SMTP id 956f58d0204a3-67c29d038a2mr256552d50.29.1794013692329;
        Fri, 06 Nov 2026 17:08:12 -0800 (PST)
X-Received: by 2002:a05:690e:438c:b0:67c:f8c:22ff with SMTP id 956f58d0204a3-67c29d038a2mr256547d50.29.1794013691939;
        Fri, 06 Nov 2026 17:08:11 -0800 (PST)
Received: from x2e.lan (108-208-224-205.lightspeed.gnbonc.sbcglobal.net. [108.208.224.205])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c134f0b5csm3091934d50.7.2026.11.06.17.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:08:11 -0800 (PST)
From: Tyler Baker <tyler.baker@oss.qualcomm.com>
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/3] misc: fastrpc: fix ADSP duplicate session creation
Date: Fri,  6 Nov 2026 20:08:01 -0500
Message-ID: <20261107010801.3451213-3-tyler.baker@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102-dup-sessions-v7-0-03f06c014e78@oss.qualcomm.com>
References: <20261102-dup-sessions-v7-0-03f06c014e78@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: A7ySvp_0-cR9HS4Lwz2IRMyyrB9kYreU
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6aee79fd cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=PFxtTy0squD/fJwW5Be2sw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=fP8dIGKjERIvVM-sKqAA:9 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDAwNCBTYWx0ZWRfX74MAtTs5p+Ie
 VmotwIkitt6nlLLzEFvimYQyjtMGQAhpz0vqa518V+pAglhwEZKxNzl4fP5pa1ppJo31rcxmvjW
 LuU8Q+gY8gLK+vNpwld67+Rgf/pvmV8=
X-Proofpoint-GUID: A7ySvp_0-cR9HS4Lwz2IRMyyrB9kYreU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDAwNCBTYWx0ZWRfXwyisJYndpBV5
 ywPLR1RNRhqcoV4zwClt9gE6FffWK4wTwZHjfLhuIqmKedRlLqxTtj6sfan0mZcLkKcGSiVOcXp
 7oXtTLF4Z+akj3ex3usRz4JvSbWmm2RIP/j1mDRIY7mQoiDkw95fxhWPi7yDk+jByZdJS9lrUan
 lo9+27QqBWa3hw+K88NPnlDTum0OW3rrEc8K2OXypbF8WNtmo4c359Mr82qjxfUkQTpycv9Eu62
 r59ZlIVoov7ThF252ASxD5KpztRk28kEwZZOZAfjMY3PqmF9NBqlnZ1fBcRtXztRQPf9M7TXiWw
 MjUuhmUuCSqKR5RTw7AWFBB8AcNiDTrsKW8avfBKLr7mok9YoYnnGVCUlKuPE4MFB6AvQYsUOsv
 Tzc/bgRfxqr8UBJfEm4z6CA6fVXsU5Tuu6a3vSTR0sfv2CLSJm/0+V1t5EwH1s3NFvSYPRTgmkp
 RVeZNSgO+1cKtHtYGFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611070004

Tested-by: Tyler Baker <tyler.baker@oss.qualcomm.com> # Eliza EVK, EL2
