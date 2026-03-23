Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DC5382299
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774303933; cv=none; b=PZDBmjzXmh4STh4Z4XfcuB8ZWeaoq55J5JnGMt2Z4J1rbehSDIgsLdKH61YfjakAvSWzree2TDe1THBssy0VQx4RkVJLMtS8nf+u2lQ1xAxphSuIkZS6KAbbaEs26rJ2ku/1Uql18FLLTIprQUIRMsfdiPNPlUCdoUDj3difPiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774303933; c=relaxed/simple;
	bh=vdlFe59wdG71Wr0TcIgUqavN/rxp2PP2ViuW4n0a7Bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fw1JVU/ciqIoI71DtyeP5uj7K2ZbVV8meaA5Sz6xCUvQNTMYyvTbFVVUhAFznct8sTTGfsLhsUq8zRVQYYvUHvyjy6SIPmsomvmDZ4PWszWrYoHwlQz7dI48NhRwA/tl3zNM2tQmHWc5MLPqosY2vrH2CdrLd9g4UZO44OTct4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IpaDkzgE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gINTp707; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IpaDkzgE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gINTp707"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqcb13170733
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:12:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VULlbFstwJLC9xQhGYSDQ6Ek
	53wDkhr/lXAneX8+L4Q=; b=IpaDkzgEuuaeoDQbRmeCrx96kOPGELC4AwiXDijy
	WNC19KXhTsvM3P/ApdYLE5gri1WU2Pa6g9fAsNSe3zzpN0gBdqY8HXntabmsFQBT
	wfLCFNM/hzr4kTg9PaS7tvoajQFMCADFMpufJFUlXPIR5Jg+USVabHZZobys9dmi
	9QkB1XJrBtKhZrVF2XQ0cl7L1SRTHc9MqDgLUH8r0idz+mPXCtVfWwBE7ouCfSfE
	+maEH8oIz0VChNDsRLxE5qg/F9LqKK01CsrsQu5JGnpiNecX3PBpdr7QWVa+6iN9
	4t604olHqWXvqSddY52DPWhkWI3pBOveoi0TLxNibO0gEQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r21vt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:12:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090bc4823cso164182911cf.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 15:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774303931; x=1774908731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VULlbFstwJLC9xQhGYSDQ6Ek53wDkhr/lXAneX8+L4Q=;
        b=gINTp7079NWpgiT+YMzRMfRX2j19b6MWwFePh9sU++6/tG5aCkUQIf9+bk5UHGibUw
         s019IcyyhBIAqWgOBOn7lD3Gm8XhKu1WpymZnJEpFPBZOW5vn7Vyy+ElwbDno2B/ySkf
         ioyHcNx01TgTDbIx7gFKEmwmIdPJmgA381jK/ClzB2mAWljOybtjKu5M8CXeuks/Zn1T
         icdcjjfFwvC+MTe+4iYszHGO583Cl6SuRBib+AUiReVJaxuLbOoYdUNTGxUSeRz3shle
         4AmKFBTLskzTltZM4fFz38QmE2ABvGaf9Z1OFqx5yFciX0fgCjyy6SOyI/iU/rKd9aO1
         FHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774303931; x=1774908731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VULlbFstwJLC9xQhGYSDQ6Ek53wDkhr/lXAneX8+L4Q=;
        b=SxSOwqQWrwdu4MmR5ITMKNaxQuPhXB5Gp89DREPlwnBdxckYu5E+/NHVIR/ae7mqjn
         g40Q8llgFe0I4LLSaJUIo0PwakKPKjTU47cJFX6pdyhdNVKOWGL4Fozu1QK02sNXwGK8
         mFQXXW6z103d26380yA8dbhtpyDydWeFw300Z2xoR+Yx/TpDf8/wd49dhPzSy6hACfcr
         pDq+sCZ0tcBdZfSQxJBpUcsvuesE9TdjGEyoNZ1yPLsUhXOnO820UZwZ96FqXB/AXPx/
         JPu1P4dZhrbtFKXZYyqLxUFT5iPKJtO3sRWYDAQS7O2MIhjXzxalwGSqDl0cLWeT7pSw
         9yTA==
X-Forwarded-Encrypted: i=1; AJvYcCWXjDwEe/vnryQMkjOOfJSVj1PA8/7jPjUTKrbnffkJFBz0z71hbA12ViRN/bI6DuQZV1snpR3NNpi8@vger.kernel.org
X-Gm-Message-State: AOJu0YzH0oj1orOPs7iQvUPQuW3k/4QGnfrj5pSp61fM4NZjZ5xRDxnm
	jivDmlHr53skjMwVvgmjiBBKLgvYC9I1K4I73+fe6TSnp8eTFZECl6B/POc4lR9S6dfRWwwKLKt
	YTO9H9Fksi2ywRzgPuYry9dWlv9RocLTSFKVcHNjOjHACmUQw1WtzHgAG/WbFjeha
X-Gm-Gg: ATEYQzxjwUUiuGlYH2RNfpjJYgCjMibAYPNgFje0Nq+O+ukKVVB0PQU2aU3QJCQYjiY
	NvmHpoHTHS0SnEvjbP1xFgn/JDyBj4mPdKhp2q+paIow4dcgIwEngZYF6Ami+I/ZOAT2RsTGwmG
	f3PlahuweBiPtF8awbuB93042JhqbAlP0J3HgZXtZkCB96cAgUVUm463Sw1mYSuiLddHftQDLe8
	IGFOjAkFunMf42kdvB82L1mQuoWtHZNd02klPrhFXci9vIodZQa06hE6h5CKEBjPbaZrEop17P1
	M1v6x4dZbJD/X488favFLeErVoQRMNRHa037xz+jj5BtvBQKbr0RzkqmyliFOxkLBSPIcQOy8ZB
	QBDx9XL86Yh8gvfC1i8i/SknVm3+Fltd0xfRqG9MaS7VUA0ERRRoIQ5YRnV4piMOMhba1iFbs8V
	brhy72BsHqNIOupATGKstrW/fB/wYkkY6PvTQ=
X-Received: by 2002:a05:622a:5590:b0:50b:5183:f1b4 with SMTP id d75a77b69052e-50b5183f2f6mr132415231cf.3.1774303930999;
        Mon, 23 Mar 2026 15:12:10 -0700 (PDT)
X-Received: by 2002:a05:622a:5590:b0:50b:5183:f1b4 with SMTP id d75a77b69052e-50b5183f2f6mr132414871cf.3.1774303930511;
        Mon, 23 Mar 2026 15:12:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9982a6csm27994131fa.25.2026.03.23.15.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:12:08 -0700 (PDT)
Date: Tue, 24 Mar 2026 00:12:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        dmitry.baryshkov@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: sm8750-mtp: Set sufficient voltage for
 panel nt37801
Message-ID: <zr65bat2eaegpuudoy7okmtazgfkubhg2w74aeomi7gxjfhtmy@bsnjg2ykiyyc>
References: <20260323102229.1546504-1-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323102229.1546504-1-quic_amakhija@quicinc.com>
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c1babb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=WnUHuuy95XYsLch6RvQA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: qTYkE_ghcSirJsEXZdaxWdnmEdC0EFEM
X-Proofpoint-ORIG-GUID: qTYkE_ghcSirJsEXZdaxWdnmEdC0EFEM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2MyBTYWx0ZWRfX1St4vQMGQjt7
 cKTRkBTHaZgK5MkF66a9XPzqAPP7cQrxcLs79lhaqwkkXC+mAgsf6Tu9cgx1fHus3R2WWO0XiE5
 ouVrf9zcAEOeC3IHINZz5HMVZS1ubYh+hZ9Wep4cCu8BRBiEqMOCjTrF1/bU0hvYmdPbL/IKNG/
 KroTjgr1b9d3+hd5mqae7PAdfkEt7Ej0jT+svwKJtwL7o9sfMj00sId5a4WweuKHAdzHmV+nwkR
 +3rB8fjPp/fFYQxD/rjDsB/RYvw5xFUxhSZbIGKXV/Wl9pX3lITBzkLmZpGcok1fBkh19dlyzrG
 R6fKfvjWXzEvlM2wra+JzYbppB9UQzvPpHUpxwlvMsruptrv+f0BM58U7F1fo10FQU5lyN5J5ro
 u1M0ME0HGK3EtsRqT9WC9El6UpyDx5gX5OFBCzvB77Ck0wkHcqXgaq+mKgXNGauSU89+oHlJx44
 +22Kx6ZAlaEfYvo4WNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230163

On Mon, Mar 23, 2026 at 03:52:29PM +0530, Ayushi Makhija wrote:
> The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>

Please switch to oss.qualcomm.com

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
