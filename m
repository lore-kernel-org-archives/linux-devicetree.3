Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498371;
	b=2HWokCdTBWnkGhDzX7t+IDqCxiMxffEnUEfQGEpwACbOKKRGTeE7eeReCCE7HyRq97JA
	 8ZjZL8JJ+DWN2q6oLuDtzUXEKw17va38w/h4i+4MwS1FLuHl37dX6Rxz5/CNynVUZRjTV
	 ivYmCQ5ecOYQ1QmzHOQo55sjopSZsA/5yUROB7N75cG1xxsrsBlPufCAoFt6n4oA9Hxd/
	 9WgiRS4AQhUw5YyTi0cTrDyesGOVP4MxG8aaVSalfDbte4xBsVCZxQfnpFavxOUqn3lFd
	 slhXdira8E5uqxH1WUzq8NDVZTK9LT1UetuQ/yvwv1Y7gxTpjyCW4xYKoG69P7QbZbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498371;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sUryX+0FjHEbTNaymK2iG7rA0dEGvt/oJcLWzKkS8io=;
	b=YR+DFblxKNrqlHGbBjh/3DlpRn0PGPUtsnPj5U5s9u7hyVGlL2NtNJft3G2M5IIMHyOq
	 /x1A50L1iYBpdUcr/2WNcRnbZ/BDqqSNRoVMjAaJGz1YgISDqrk3WLa5rI0CAHGI9+J0b
	 PZDb1Ga5rpAA8IfdQC/04u+BtKcZCQzmBrPFd95LQagvwZh4ahoeAoTcvx1GqTYup7h2A
	 FnntB0AQ6YFWzhQfnBjp8zksbGC3xjxDMz5w3dCnl2CbS1Ab49OAWDTttp7o74fg7RKzG
	 98GibqujjyIFg46B+qfekp6V4boHsmBbipBoYkMs0nUwcPqtFUjWJFWdk7ilHL4gmLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xohs3uYI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A6XNMzBB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D512B606A31B
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D512B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xohs3uYI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A6XNMzBB
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxA2L419924
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:12:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sUryX+0FjHEbTNaymK2iG7rA
	0dEGvt/oJcLWzKkS8io=; b=Xohs3uYIL0ww0NyrblbGtm+PpOq40M2vBPAFANL9
	PY6Eqm3X9/7ChEA2n0TzRcCUsVv/C4lVqK07HW41T49goqZG6toiutmJefxqJFSp
	zkHnBrEd4BqI9jDPR2Wv4V0Em2VDxSXsBylfZlslaZmrJgN6XYEIZ7qikUl68z9v
	FeGcqR/dJ6uXs6klBisbV53pdFOJmdA3sHflqCSr/cWj+sTPSYSfnJuIDGDCxuPi
	mZ9HOQFpjnZQCwGBird1670WQshX75ljZmPFmKGEqPJrpx8vP2bIhvHcwIpoAJOa
	UGSKbiQmnxEjJo3J9FAGXRDjEtXruMgy8AaEeZXqrHd3lw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5stbpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:12:49 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c1a2c3b118so2849496137.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 05:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792498369; x=1793103169; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sUryX+0FjHEbTNaymK2iG7rA0dEGvt/oJcLWzKkS8io=;
        b=A6XNMzBBO8GYXQ/i/E7oipglgXHT/Gxh7/83J9Y9fREB+qu+AN1ophY5babQYUHZwl
         JiZUQ2NyVi3fBqk9Nli70vfZQzHruv5V8p09iJKY14/O/1e1QzeG6DmR/Cg4FRTU/Gax
         L0qjd7NaYcOrKVYRz2FC/C57x3KOJTdH2/Aa6TY5PnkbuptO9Jqtl6o1FMHrAcPmpWc0
         lbI7dLBJYxvwM9fqquNUnas7UG+H/UV1z6paLg7XLnxQUCnlPKg0EU2WVLxDixovBXrd
         FejQEZwl3sDsoeWBUqvisvnFhYaVr+JN9Ye1fn2sgAcTmz4UbTIeuX9j1lHAjI6E3RPP
         a7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792498369; x=1793103169;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sUryX+0FjHEbTNaymK2iG7rA0dEGvt/oJcLWzKkS8io=;
        b=cCwKm8YnrEIDFx59+8nwDvgrlDjgREqcQTCUKSlh0ON/+FACcdvKW04iAnxpgoJxzX
         naPNxI3FWU1MDBH3zFvug6cFy+5vrKto7CPTbOHcZwBUxR5mv2HrFteackyxuB/Y6A8Z
         SjSjCiLjeh5YZXuEmIk/IsdGuUxr/wKG4UoHdYFqrw1q+V2DE6uVDK67eysyaEVjCoOR
         lnvv1OVsWbcHYKZCQt9Xk17R4r6Mbt+2d9ecIIRtcL4wny0weUfvu8kY8nc8NQdMWVs8
         r3UW5fTgW0kxq4hfcZR2rAhmWiMDYxYnhYfri5OHggcGlHyLIHK7EtALlDGKxzSurbwH
         qHFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwRUE55dDj0ZIZfE8cvUNL3x9wPXpGa5uzzfbLIEYiNaR7ix9nY6/tLLecUHQ61wldXob5eSoJF2uXm@vger.kernel.org
X-Gm-Message-State: AFq9FYLBv7vN1pj1PnyHu82hMOgwCIlx6evWZ5px6+rqfT+9pms7pyYX
	Z2I6Qc56lFqgs/MEY20sRqpkYVLkUoVUVSaIdIFssFjcLvjML0HjJKyChdNOdK5/0glmdUUWWnA
	sU4ySNHbe/EiQRalMbXyfHHyyo+JTBMD/r7+wXcbAT0zccSESr3w9l4984kFjUSVC
X-Gm-Gg: AYBFou0zKzHYHo2jD+nyluThTr1pG0meSZfnzia+UHaArO5X+651OKGhQ9UXsPwibVQ
	kx++rW5NNB8gdKnFdqsl71MWforUZrNUUZJ7oYUgHFsnJJOA6GLqvWKTqg3tQOfOBH9k9IwYu3s
	igUu2ZnD4qB/UlvxPzHWw6KRqvWZ8WAyGOnicVuBIYLm3NqiTflVJMHA3gEvZ8WCbRd7AgpOohM
	BucFo4G0UN6szalyYu/xEK/L9N1a9TTsFItaxz0nZTXKVKaYCleP9qFPyuZM2NfmdbF7IDpgvoF
	J1B+Y5D9PvWND/qRfmKUYivCHwL6pUDuNPT5et6GorX3vJGTaTqQO50lt87FEtsMpNt3qVRSTVO
	K6F3M5g5JbQmrBaVC
X-Received: by 2002:a05:6102:2c8e:b0:7cc:2712:caf2 with SMTP id ada2fe7eead31-7cc36a4cd38mr3055820137.23.1792498368751;
        Tue, 20 Oct 2026 05:12:48 -0700 (PDT)
X-Received: by 2002:a05:6102:2c8e:b0:7cc:2712:caf2 with SMTP id ada2fe7eead31-7cc36a4cd38mr3055811137.23.1792498368097;
        Tue, 20 Oct 2026 05:12:48 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cdf2f0d1sm205783705e9.2.2026.10.20.05.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:12:47 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:12:45 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: lemans: Add label for firmware
 and reserved-memory
Message-ID: <rhh7s766m77am3yfktpeaikyswehfn5pa3l3hsbd2ugegmq4te@4rea24zv6an2>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-5-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015023711.721837-5-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfX6BNS4RJL/+Yf
 F6YGucZJmPmRRSdFIpmmam9dTFiMDAi+oMaeQryh/gwJeD9kZ+SeQ/R1b+Ky8QSOdAXp//wHGBx
 MGKiYe/rZQqQVzihqT2RTD/bnGw7IUWxq7Gefg8dPdsTNzAMKeZBLvmEFt9stn2xQTzVI4U1qEs
 PVZe8OcFlJ+C2tmJwJUaI0vxV8xGMd7G0PLFPW/oSVwvCAR/mAi+Mvo9MLg7iILxa4q6e/wAys5
 qa2PmbKfkJuvCFK/rovdCEU3lt+5Og61wzKNcnXbMlQ90b0pNmd9EsYCclrQJChHLwTMjBROd/p
 i7LUhwzch9uUbrlJgUQItksrQhmgTE2j3L+QiLgf0aYCLtk4wJWQFBA40BozkpeVfH8Yra4nOxY
 rFhskDZHW9YsY6ctu/CToxSxZnIWC9BV4ZzqLLwLPvQHxgqdce/O5Tk/kWETSNZ5Qg6BFmmXYt0
 GTusQ0gOKQcH6lsP1iA==
X-Authority-Analysis: v=2.4 cv=fIusTpae c=1 sm=1 tr=0 ts=6ad75ac1 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=8WBkPR08O5TzQ9HkguUA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: gWx6kqvaFHJZtAPWsipU4CNCWkKaG_hh
X-Proofpoint-ORIG-GUID: gWx6kqvaFHJZtAPWsipU4CNCWkKaG_hh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfX9C0m4GtHGgyV
 d1zIdKFrYbpFW+7QjM7jItrdThqqcApNB+Z3c+/5vRDA7Pm2FFjmiswoGhShzK00hSjgkqPNes7
 mptFXMUWanlxm0F4NEIs8ym0jcbXZL8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200048

On 26-10-15 10:37:08, Shawn Guo wrote:
> Add label for firmware and reserved-memory node to make it easier for user
> to override the default configuration.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

This could've been part of patch 5. In any case:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
