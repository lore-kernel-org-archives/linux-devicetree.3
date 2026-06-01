Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC55367B8A
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 12:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780315667; cv=none; b=O/AC6fYF0hBqaQRLzQ6TqqJ07ZFz3cwwrmctSTJSfWEPXZtC4d/3/pnlvi48GxIxdCgZvR13fxWssr9EyxixHiTUR3Ej0pBKmesdPVRX/ZYwb2iLDJGW+AAJWFDuToTonK8JLONvVGixJ1O/BXG3MSl8VO5U9VYydQK6myD4zEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780315667; c=relaxed/simple;
	bh=zs0qdbXs2x30afTWW7YL6ZC9DLX82eZT/SOhbldZUH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XgSSQ4HsoW1CdR3ukxmXpG+isxYWyx/7xYXCFRsro84538/OinSV2uI4Jvs/qfKB/SBo579fLKsLkP6aT6EHRcH5Uz9NUO5yBVqstySF7u+iQZX/800vcqlfyzOvFydWNcL4XCcVvYGhe4k1UI5Xp2/JcpPKLlQlhjH0ctrBRjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YOkbTG24; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gj1Vnceg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YOkbTG24";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gj1Vnceg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518fGbP1257597
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 12:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dv11lKJOxLoelkQcyG8M51LX
	H0JVFSvQtsQEal0SIx0=; b=YOkbTG24moufP5CdBcqmMwE9sLCpQl45J7dEwBT8
	f+iuJCMLrmkN3vziDKDfcPRPTGeeJqfmP4N67LZIJik6PvBnTPK6b5JjrhMpOPy8
	qaT0kZ65/fkIpMUjSKkwvhpTTW05D37684pzg40tU24lK5tLCcKtF2vKtIULHQ9P
	7hwSeO2F/0XOyb80YXw2B7gODzRsq6+7nfxlDy9KpYVin+bhDBl9RqtQN6cWlG/9
	aXTlxrp+e0Bdby+gBscZ//Q33Yddd70HtNXNbNZib7Ct+pDNa0KRFolOJJGFEZu0
	laK7XZUa9o2wg2Ljsc4dfe5oi3gBuln1DW7jCU4TLNQt5A==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6ssrufk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 12:07:44 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-59a66f2ed03so1442495e0c.2
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 05:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780315664; x=1780920464; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dv11lKJOxLoelkQcyG8M51LXH0JVFSvQtsQEal0SIx0=;
        b=gj1VncegwH0cESmBjQXP5s5apMyQ1mDGGfhByd7lQ+xO9XIp9WRgL4pKKaqlvBeART
         vyoAqeFFsYSRHkarEcQjwuFFkMIw4VP4U5CIgjaGuak2r3dOdKt2NHyl59+u2r4o6NhM
         I8goOHs4MqaXqZs1NXTzaepD4eysAefZWHJl2b8uv6zBXXtmyYXh7ilKAhTCjfymTYNV
         1oGJnNY9DoJUbw3cZ6+Hp26ouzwgBNjAyM3y/nqL3CMemI0eFAmQB3ACV15ebxoDe2hk
         iXtsYp1qtJH0ywNYtcaZLwoC82hDXF68ByzRLzbz3jN5wQ1GxpqMkAoGe/RDaeg/WSWC
         4Nzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780315664; x=1780920464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dv11lKJOxLoelkQcyG8M51LXH0JVFSvQtsQEal0SIx0=;
        b=XPEtNuxVjwmKXJMZtE3/mxAPl7EtS3SY8BIa+9tDqm5WSbfxJdl761SyLWgDMs8ibr
         gXFpb1AMiGjHtUOCBFO4j8u1KszlB9revsk64hddSxvpenC60P6glpZMx9b2f5s0Sb50
         iXcttby0WnjOwuixRfM0ylbBiBVNKAn0sDGH8jGt4A5nxwU7dZeEDoaUV8Tx85VI/71p
         7kpdV1GBH1wC06rMzsVlU6SgqHnO9HxX08jYlOCrMqW5i1fQ2P/mhWIFr4tVuA08pkUe
         uSxfFY0zfhX+0HAg60kMBkjQxsuAdtE/Nn+ZbNkKqp/D0lQd/KOxrhbAVTDImGPzNtip
         E6pw==
X-Forwarded-Encrypted: i=1; AFNElJ/p3Cn/oxqaknBME0yH/MMRyyewqewTFDxEhXMqNhtjuK9r5+Ot/9m5h/KmwvzFn0EZxmkDYDL4cBY1@vger.kernel.org
X-Gm-Message-State: AOJu0YzVjXRnyzNSO/ruZ8cKe4cors21JdWbxEyC0zsnPid7YyvIUSUd
	UyfC2XymdcdwJmAL6olLREKPvOVRlbHOWoV7DhJ7mRShlKVB+AAoY98KcB4CBEEASfvJ5UGGitG
	36sAeMkzBwwY4sbr3e8cp5LIXeJSgcnhpNGvTcAy4ToJFUc1IicW4ruJ+vXFPw2n3
X-Gm-Gg: Acq92OGer3jk51kDNF3uPKQJdY6bEeHqN2VdvlN9EdczOUaUA/FdglH7uyRpCa6m26+
	JiKPTr5frDl5oNLgUirEOlMJSUzLF/8fYF5T8Ww68vI344ODoDQOdBvpzBuI70aCu7IvxCouZrz
	0nI951b4gnJ21yZRLRZC/qeUJyryzanz0rxaqeoyQ2Q+4bG5ALR/tYaFu7eea4LiWSCz1Yxj3rE
	E4jeXthHwCBxEYp0xtusckJfai4oFkv8a6HO/3T+EvgD6pVQvNY6xT03AOp372fUmqVNUN+Y15D
	VfQ+jkZ7k/aIC9E/dFVwLYbF633N9pCcCqhedYZWOKayx4hxktTGW1cH2XnSnrtU7vseifP1QBu
	hExag40sQLNaCSHHhMqPtGVXn4SEiIabYq+Z72U9pHVrysJc9+K5ED/7lDkaBL/Wnu3PvHo4wCk
	DrWZk9VDMtGG2GIP5H2wRdfQWhYj7bVTVNsN/aAefPHkE9/w==
X-Received: by 2002:a05:6122:178b:b0:5a2:5c65:850f with SMTP id 71dfb90a1353d-5a25c658b47mr683141e0c.10.1780315663890;
        Mon, 01 Jun 2026 05:07:43 -0700 (PDT)
X-Received: by 2002:a05:6122:178b:b0:5a2:5c65:850f with SMTP id 71dfb90a1353d-5a25c658b47mr683042e0c.10.1780315663363;
        Mon, 01 Jun 2026 05:07:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa62f7f539sm1516467e87.4.2026.06.01.05.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:07:42 -0700 (PDT)
Date: Mon, 1 Jun 2026 15:07:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux@smankusors.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 10/10] ARM: dts: qcom: msm8960: huashan: enable Wi-Fi
 and Bluetooth
Message-ID: <vsbimklkzmee63nfwpnx2b7dtlilfcaqwv6d3gj4xkmm6x7hpd@rdc75raf7q4b>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-10-fec6ac8dba02@smankusors.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-msm8960-wifi-v3-10-fec6ac8dba02@smankusors.com>
X-Proofpoint-ORIG-GUID: D-10qlAkWZQ4vmxF5585Gf49fa8xvy65
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEyMSBTYWx0ZWRfX+NIFAEEhiXjx
 nvG/iJhneebGUqER1ZHxowTe/g2Ga8puuCop41wfhAv0CpwVoR63ItIlxtPsLNvXGnJ323U0AkK
 YEjhN9tnK87SMuuncx14HiI1wlRfKBIjB31mrXP/Qr03oKQM05hVMNNWRuGWguChmuiLfkWg6zE
 nXBsRE2uV6699OGzBDb9rBXUxGXzjG57BcXtYsi7EBjiO2roJPfzGV4VTYhMbzagNo/Ztr8NHs2
 fQUoaBFaLQsmygrVn6dvHG+SRd9lfy5BFOsdveGfychUuFV5xTn0SYThQWFOjWd4Rlm/6/dX3DH
 wKpg8ByEa2QkAE1h9jABLZ+7AXpidh6wVp07ZBV8OjLy9/0SL69ONTGggUSnFhCS8WGqIEXEiPS
 hZ3GEBQ6SKf86lKcdo44iCIacMAiRAgF7mgOfHq1oLu/LOeh4X3m+pecBS8wWKuBNi+TCyPdL2R
 ZgyAaw2dJlLP2/A6M+A==
X-Authority-Analysis: v=2.4 cv=O5wJeh9W c=1 sm=1 tr=0 ts=6a1d7610 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=wxLWbCv9AAAA:8
 a=EUspDBNiAAAA:8 a=Li_iKjNru-aZ8oNNNaIA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-GUID: D-10qlAkWZQ4vmxF5585Gf49fa8xvy65
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010121

On Mon, Jun 01, 2026 at 03:51:23PM +0700, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Add Wi-Fi and Bluetooth support for Sony Xperia SP.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
